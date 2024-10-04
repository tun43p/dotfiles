function osx -d "Some utils for OSX"
    function help
        set -l lines "Usage: osx <string>" "- help, h: Get the IP address if the current machine" "- ip: Get the IP address of the current machine" "- hide: Hide a file from Finder" "- unhide: Unhide a file from Finder"

        for line in $lines
            echo $line
        end
    end

    if test (count $argv) -eq 0
        help
        return 1
    end

    switch $argv[1]
        case help h
            help
        case ip
            # Get the IP address of the current machine
            ipconfig getifaddr en0
        case hide
            # Hide a file from Finder
            chflags hidden $argv[2]
        case unhide
            # Unhide a file from Finder
            chflags nohidden $argv[2]
        case refresh-dock:
            # Refresh the Dock
            defaults write com.apple.dock ResetLaunchPad -bool true
            killall Dock
        case update
            if test -d "$HOME/tmp"
                rm -rf "$HOME/tmp"
            end

            if test -d "$HOME/ai_overlay_tmp"
                rm -rf "$HOME/ai_overlay_tmp"
            end

            # Update Homebrew, upgrade all packages, clean up, upgrade all casks, and update the system
            brew update && brew upgrade && brew cleanup
            brew upgrade --cask $(brew list --cask)
            sudo softwareupdate -i -a
        case '*'
            echo "Unknown script"
            return 1
    end

end
