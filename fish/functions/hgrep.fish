function hgrep -d "Grep for a string in Fish history file"
    set -l help "Usage: hgrep <string>"

    # If no arguments are passed, print the help message
    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    # Search for the string in the fish history file
    cat $HOME/.local/share/fish/fish_history | grep $argv
end
