#!/usr/bin/env bash
# Claude Code status line
# Fields: cwd | git branch | lines | model | output style | ctx bar | tokens | duration | cost

input=$(cat)

# --- ANSI colors ---
RESET=$'\033[0m'
BOLD=$'\033[1m'
DIM=$'\033[2m'
RED=$'\033[31m'
GREEN=$'\033[32m'
YELLOW=$'\033[33m'
BLUE=$'\033[34m'
MAGENTA=$'\033[35m'
CYAN=$'\033[36m'
GRAY=$'\033[90m'

# --- Working directory ---
cwd=$(echo "$input" | jq -r '.cwd // .workspace.current_dir // empty')
dir_display=""
[ -n "$cwd" ] && dir_display=$(basename "$cwd")

# --- Git branch ---
git_branch=""
if [ -n "$cwd" ]; then
    git_branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null \
        || git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
fi

# --- Lines added / removed (session) ---
lines_display=""
lines_added=$(echo "$input"   | jq -r '.cost.total_lines_added   // 0')
lines_removed=$(echo "$input" | jq -r '.cost.total_lines_removed // 0')
if [ "$lines_added" != "0" ] || [ "$lines_removed" != "0" ]; then
    lines_display="${GREEN}+${lines_added}${RESET}${GRAY}/${RESET}${RED}-${lines_removed}${RESET}"
fi

# --- Model ---
model=$(echo "$input" | jq -r '.model.display_name // empty')

# --- Output style (only if not default) ---
style=$(echo "$input" | jq -r '.output_style.name // empty')
style_display=""
if [ -n "$style" ] && [ "$style" != "default" ] && [ "$style" != "Default" ]; then
    style_display="${DIM}${BLUE}(${style})${RESET}"
fi

# --- Context length: prefer recomputed from transcript, fall back to input JSON ---
transcript_path=$(echo "$input" | jq -r '.transcript_path // empty')
real_ctx_tokens=""
if [ -n "$transcript_path" ] && [ -f "$transcript_path" ]; then
    # Most recent main-chain (non-sidechain, non-error) assistant usage entry
    real_ctx_tokens=$(tail -r "$transcript_path" 2>/dev/null | jq -r '
        select(
            (.message.usage // null) != null
            and (.isSidechain // false) == false
            and (.isApiErrorMessage // false) == false
        )
        | (.message.usage.input_tokens // 0)
        + (.message.usage.cache_read_input_tokens // 0)
        + (.message.usage.cache_creation_input_tokens // 0)
    ' 2>/dev/null | awk 'NF{print; exit}')
fi

ctx_tokens=""
ctx_pct=""
if [ -n "$real_ctx_tokens" ] && [ "$real_ctx_tokens" != "0" ]; then
    ctx_tokens="$real_ctx_tokens"
    ctx_pct=$(awk -v t="$real_ctx_tokens" 'BEGIN{printf "%.1f", (t/200000)*100}')
else
    ctx_pct=$(echo "$input"     | jq -r '.context_window.used_percentage    // empty')
    ctx_tokens=$(echo "$input"  | jq -r '.context_window.total_input_tokens // empty')
fi

# --- exceeds 200k flag ---
exceeds_200k=$(echo "$input" | jq -r '.exceeds_200k_tokens // false')

# --- ASCII context bar (20 chars, colored by threshold) ---
bar=""
if [ -n "$ctx_pct" ]; then
    filled=$(echo "$ctx_pct" | awk '{printf "%d", ($1/100)*20; if($1>100) print 20}')
    [ "$filled" -gt 20 ] && filled=20
    empty=$((20 - filled))

    ctx_color=$(echo "$ctx_pct" | awk -v g="$GREEN" -v y="$YELLOW" -v r="$RED" '{
        if ($1 < 15)      print g
        else if ($1 < 30) print y
        else              print r
    }')

    bar="${GRAY}[${RESET}${ctx_color}"
    for i in $(seq 1 $filled); do bar="${bar}#"; done
    bar="${bar}${GRAY}"
    for i in $(seq 1 $empty);  do bar="${bar}-"; done
    bar="${bar}${RESET}${GRAY}]${RESET} ${ctx_color}$(printf '%.0f' "$ctx_pct")%${RESET}"

    if [ "$exceeds_200k" = "true" ]; then
        bar="${bar} ${BOLD}${RED}!${RESET}"
    fi
fi

# --- Token count ---
tokens_display=""
if [ -n "$ctx_tokens" ] && [ "$ctx_tokens" != "0" ]; then
    if [ "$ctx_tokens" -ge 1000 ]; then
        tokens_display=$(echo "$ctx_tokens" | awk '{printf "%.1fk", $1/1000}')
    else
        tokens_display="${ctx_tokens}"
    fi
fi

# --- Session duration ---
duration_display=""
duration_ms=$(echo "$input" | jq -r '.cost.total_duration_ms // empty')
if [ -n "$duration_ms" ] && [ "$duration_ms" != "0" ]; then
    duration_display=$(echo "$duration_ms" | awk '{
        s = int($1/1000)
        h = int(s/3600); s -= h*3600
        m = int(s/60);   s -= m*60
        if (h > 0)      printf "%dh%dm", h, m
        else if (m > 0) printf "%dm", m
        else            printf "%ds", s
    }')
fi

# --- Session cost (authoritative) ---
cost_display=""
total_cost=$(echo "$input" | jq -r '.cost.total_cost_usd // empty')
if [ -n "$total_cost" ]; then
    cost_display=$(echo "$total_cost" | awk '{
        if ($1 < 0.01)    printf "$0.00"
        else if ($1 < 1)  printf "$%.4f", $1
        else              printf "$%.2f", $1
    }')
fi

# --- Assemble line ---
parts=()
[ -n "$dir_display" ]      && parts+=("${BOLD}${CYAN}${dir_display}${RESET}")
[ -n "$git_branch" ]       && parts+=("${MAGENTA}(${git_branch})${RESET}")
[ -n "$lines_display" ]    && parts+=("${lines_display}")
[ -n "$model" ]            && parts+=("${BLUE}[${model}]${RESET}${style_display}")
[ -n "$bar" ]              && parts+=("${GRAY}ctx:${RESET}${bar}")
[ -n "$tokens_display" ]   && parts+=("${GRAY}tok:${RESET}${YELLOW}${tokens_display}${RESET}")
[ -n "$duration_display" ] && parts+=("${GRAY}${duration_display}${RESET}")
[ -n "$cost_display" ]     && parts+=("${GREEN}${cost_display}${RESET}")

result=""
for part in "${parts[@]}"; do
    [ -n "$result" ] && result="${result} ${GRAY}|${RESET} "
    result="${result}${part}"
done

printf "%s" "$result"
