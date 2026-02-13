# git.nu — Git aliases and helpers

# git status (short)
export def gs [] { git status --short }

# git status (full)
export def gss [] { git status }

# git log (pretty)
export def gl [--num(-n): int = 16] {
    git log --reverse -n $num --pretty="%h»¦«%s»¦«%aN»¦«%aD»¦«%D"
    | lines
    | split column "»¦«" sha message author date refs
    | update date {|row| $row.date | into datetime }
}

# git diff
export def gd [
    file?: path
    --staged(-s)
    --cached(-c)
] {
    let s = if ($staged or $cached) { [--staged] } else { [] }
    let f = if ($file | is-not-empty) { [$file] } else { [] }
    git diff ...$s ...$f
}

# git add
export def ga [
    ...files: path
    --all(-A)
    --patch(-p)
] {
    if $all {
        git add --all
    } else if $patch {
        git add --patch
    } else if ($files | is-empty) {
        git add .
    } else {
        git add ...$files
    }
}

# git commit
export def gc [
    message?: string
    --all(-A)
    --amend(-a)
] {
    let m = if ($message | is-not-empty) { [-m $message] } else { [] }
    let a = if $all { [--all] } else { [] }
    let n = if $amend { [--amend] } else { [] }
    git commit -v ...$m ...$a ...$n
}

# git push
export def gp [
    --force(-f)
    --set-upstream(-u)
] {
    let f = if $force { [--force-with-lease] } else { [] }
    let u = if $set_upstream {
        let branch = (git rev-parse --abbrev-ref HEAD | str trim)
        [--set-upstream origin $branch]
    } else { [] }
    git push ...$f ...$u
}

# git pull with rebase
export def gpl [--merge(-m)] {
    if $merge {
        git pull
    } else {
        git pull --rebase --autostash
    }
}

# git branch
export def gb [branch?: string --delete(-d)] {
    if ($branch | is-empty) {
        git branch -vv
    } else if $delete {
        git branch -D $branch
    } else {
        git checkout $branch
    }
}

# git switch / create
export def gsw [branch: string --create(-c)] {
    if $create {
        git switch -c $branch
    } else {
        git switch $branch
    }
}

# git stash
export def gst [
    --pop(-p)
    --list(-l)
    --apply(-a)
    --drop(-d)
] {
    if $pop { git stash pop }
    else if $list { git stash list }
    else if $apply { git stash apply }
    else if $drop { git stash drop }
    else { git stash }
}

# git history (contributors)
export def gha [] {
    git log --pretty="%h»¦«%aN»¦«%s»¦«%aD"
    | lines
    | split column "»¦«" sha author desc date
    | histogram author merger
    | sort-by merger
    | reverse
}

export alias gcl = git config --list
export alias gts = git tag -s
