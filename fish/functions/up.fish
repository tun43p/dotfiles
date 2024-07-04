# TODO(tun43p): Explain the purpose of this script

function update_system_and_servers -d "Update system and servers"
    set -l help "Usage: up"

    if test -d "$HOME/tmp"
        rm -rf "$HOME/tmp"
    end

    if test -d "$HOME/ai_overlay_tmp"
        rm -rf "$HOME/ai_overlay_tmp"
    end

    echo "Updating system..."
    brew update && brew upgrade && brew cleanup
    echo "System updated"

    echo "Updating mail server..."
    ssh mail.tun43p.com -t "sudo apt-get update && sudo apt-get full-upgrade -y"
    echo "Mail server updated"
end

alias up update_system_and_servers
