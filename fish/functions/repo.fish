function repo -d "Go to a repository"
    set -l help "Usage: repo <source> [folder]"

    set -l target_dir

    set -l github_dir $CODE/github.com/tun43p
    set -l github_blackfoot_dir $CODE/github.com/blackfoot-makers
    set -l labinno_dir $CODE/git.labinno.fr/cloud/maryse

    set -l all_dirs $github_dir/* $github_blackfoot_dir/* $labinno_dir/*

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    switch $argv[1]
        case help h
            echo $help

        case blackfoot bf
            if test (count $argv) -eq 1
                cd $github_blackfoot_dir
            end

            set target_dir $github_blackfoot_dir/$argv[2]

        case labinno bt
            if test (count $argv) -eq 1
                cd $labinno_dir
            end

            set target_dir $labinno_dir/$argv[2]

        case tun43p me
            if test (count $argv) -eq 1
                cd $github_dir
            end

            set target_dir $github_dir/$argv[2]

        case '*'
            echo "Unknown source"
            return 1
    end

    if contains -- $target_dir $github_dir/*; or $github_blackfoot_dir/* $labinno_dir/*
        cd $target_dir
    else
        if test (count $argv) -eq 1
            return 0
        else
            echo "Unknown folder"
            return 1
        end
    end
end
