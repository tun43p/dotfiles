# TODO(tun43p): Explain the purpose of this script

function osx -d "Some utils for OSX"
    set -l help "Usage: osx <string>"

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    switch $argv[1]
        case help h
            echo $help
        case ip
            ipconfig getifaddr en0
        case hide
            chflags hidden $argv[2]
        case unhide
            chflags nohidden $argv[2]
        case '*'
            echo "Unknown script"
            return 1
    end

end
