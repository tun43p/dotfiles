function bf -d "Utils for Blackfoot"
    set -l help "Usage: bf <script> [option]"

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    switch $argv[1]
        case help h
            echo $help

        case ssh s
            set -l ssh_help "Usage: bf ssh [macmini]"

            if test (count $argv) -eq 1
                echo $ssh_help
                return 1
            end

            switch $argv[2]
                case help h
                    echo $ssh_help

                case macmini m
                    ssh macmini.blackfoot.io

                case '*'
                    echo "Unknown option"
                    return 1
            end

        case vpn v
            set -l vpn_help "Usage: bf vpn [up,down]"

            if test (count $argv) -eq 1
                echo $vpn_help
                return 1
            end

            switch $argv[2]
                case help h
                    echo $vpn_help

                case up u
                    wg-quick up $ARCHIVES/VPN/blackfoot.io/wg0.conf

                case down d
                    wg-quick down $ARCHIVES/VPN/blackfoot.io/wg0.conf

                case '*'
                    echo "Unknown option"
                    return 1
            end

        case '*'
            echo "Unknown script"
            return 1
    end
end
