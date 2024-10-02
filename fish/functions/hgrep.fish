function hgrep -d "Grep for a string in Fish history file"
    set -l help "Usage: hgrep <string>"

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    cat $HOME/.local/share/fish/fish_history | grep $argv
end
