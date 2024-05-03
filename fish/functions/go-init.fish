# TODO(tun43p): Explain the purpose of this script

function go-init -d "Create a new Golang project"
    set -l help "Usage: go-init <project-name>"

    # TODO(tun43p): Add a flag to specify the project path
    set -l tag github.com/tun43p
    set -l name $argv[1]
    set -l dir $CODE/$tag/$name
    set -l src $GOPATH/src

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    if test -d $dir
        echo "Project already exists"
        return 1
    end

    mkdir $dir && cd $dir
    go mod init $name
    git init

    if not test -d $src/$tag
        mkdir -p $src/$tag
        echo "Directory created at $src/$tag"
    end

    ln -sf $dir $src/$tag/$name

    echo "Project created at $dir"
end
