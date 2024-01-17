function up -d "Update the system"
    set -l help "Usage: up"

    if test -d "$HOME/tmp"
        rm -rf "$HOME/tmp"
    end

    brew update && brew upgrade && brew cleanup
end
