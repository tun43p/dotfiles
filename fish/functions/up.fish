# TODO(tun43p): Explain the purpose of this script

function up -d "Update the system"
    set -l help "Usage: up"

    if test -d "$HOME/tmp"
        rm -rf "$HOME/tmp"
    end

    echo "Updating brew..."
    brew update && brew upgrade && brew cleanup

    echo "Updating mail..."
    t43 ssh mail update
end
