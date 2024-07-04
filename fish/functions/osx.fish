function osx -d "Some utils for OSX"
    set -l help "Usage: osx <string>"

    # If no arguments are passed, print the help message
    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    switch $argv[1]
        case help h
            echo $help
        case ip
            # Get the IP address of the current machine
            ipconfig getifaddr en0
        case hide
            # Hide a file from Finder
            chflags hidden $argv[2]
        case unhide
            # Unhide a file from Finder
            chflags nohidden $argv[2]
        case '*'
            echo "Unknown script"
            return 1
    end

end
