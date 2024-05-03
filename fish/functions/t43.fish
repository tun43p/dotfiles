# TODO(tun43p): Explain the purpose of this script

function t43 -d "Utils for tun43p"
    set -l help "Usage: t43 <script> [option]"

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    switch $argv[1]
        case help h
            echo $help
        case ssh s
            set -l ssh_help "Usage: t43 ssh [mail]"
            if test (count $argv) -eq 1
                echo $ssh_help
                return 1
            end

            switch $argv[2]
                case help h
                    echo $ssh_help
                case mail m
                    switch $argv[3]
                        case help h
                            echo "Usage: t43 ssh mail [update]"
                        case update u
                            ssh mail.tun43p.com -t "sudo apt-get update && sudo apt-get full-upgrade -y"
                        case '*'
                            ssh mail.tun43p.com
                    end
                case '*'
                    echo "Unknown option"
                    return 1

            end
    end
end
