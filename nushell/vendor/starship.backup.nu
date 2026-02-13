# starship.nu — Starship prompt integration
# Install: brew install starship

export-env {
    $env.STARSHIP_SHELL = "nu"
    $env.STARSHIP_SESSION_KEY = (random chars -l 16)

    $env.PROMPT_COMMAND = {||
        (
            ^starship prompt
                --cmd-duration $env.CMD_DURATION_MS
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
        )
    }

    $env.PROMPT_COMMAND_RIGHT = {||
        (
            ^starship prompt
                --right
                --cmd-duration $env.CMD_DURATION_MS
                $"--status=($env.LAST_EXIT_CODE)"
                --terminal-width (term size).columns
        )
    }

    $env.PROMPT_INDICATOR = ""
    $env.PROMPT_INDICATOR_VI_INSERT = ""
    $env.PROMPT_INDICATOR_VI_NORMAL = ""
    $env.PROMPT_MULTILINE_INDICATOR = (^starship prompt --continuation)

    $env.config = ($env.config | merge {
        render_right_prompt_on_last_line: true
    })
}
