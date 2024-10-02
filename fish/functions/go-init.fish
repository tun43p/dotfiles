function go-init -d "Create a new Golang project"
    set -l help "Usage: go-init <project-name>"

    set -l tag github.com/tun43p
    set -l name $argv[1]
    set -l dir $CODE/$tag/$name
    set -l src $GOPATH/src

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    if test (count $argv) -eq 2
        if test $argv[2] = -d
            trash $dir
            trash $src/$tag/$name
            echo "Project deleted"
            return 0
        end
    end


    if test -d $dir
        echo "Project already exists"
        return 1
    end

    mkdir $dir && cd $dir
    go mod init $tag/$name
    git init

    if not test -d $src/$tag
        mkdir -p $src/$tag
        echo "Directory created at $src/$tag"
    end

    ln -sf $dir $src/$tag/$name

    echo "Project created at $dir"
end
