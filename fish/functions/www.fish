# TODO(tun43p): Explain the purpose of this script

function www -d "Open an internet page"
    set -l help "Usage: www <link>"

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    switch $argv[1]
        case help h
            echo $help
        case *
            if not contains -- $argv[1] https://; or http://
                open https://$argv[1] -a $BROWSER
            else
                open $argv[1] -a $BROWSER
            end
    end
end
