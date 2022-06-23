function hh -d "Initialize an Harhat project"
    if test (count $argv) -lt 1; or test $argv[1] = --help
        echo "Initialize an Hardhat project."
        echo "Usage: hh [name]"
    else
        mkdir $argv[1]
        cd $argv[1]
        yarn init -y
        yarn add -D hardhat
        yarn hardhat
    end
end
