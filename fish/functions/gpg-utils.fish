function gpg-utils -d "GPG utilities"
    set -l help "Usage: gpg-utils <list | touchid | tty>"

    set -l gpg_conf $HOME/.gnupg/gpg.conf
    set -l gpg_agent_conf $HOME/.gnupg/gpg-agent.conf

    if test (count $argv) -eq 0
        echo $help
        return 1
    end

    switch $argv[1]
        case help h
            help
        case list l
          gpg --list-secret-keys --keyid-format LONG
        case touchid
          if not grep -q "no-tty" $gpg_conf
              echo "no-tty" >> $gpg_conf
          end

          if not grep -q "pinentry-program /opt/homebrew/bin/pinentry-touchid" $gpg_agent_conf
              echo "pinentry-program /opt/homebrew/bin/pinentry-touchid" >> $gpg_agent_conf
          end

          killall gpg-agent

          cat $gpg_conf
          cat $gpg_agent_conf
        case tty 
          if grep -q "no-tty" $gpg_conf
              sed -i '' '/no-tty/d' $gpg_conf
          end

          if grep -q "pinentry-program /opt/homebrew/bin/pinentry-touchid" $gpg_agent_conf
              sed -i '' '/pinentry-program \/opt\/homebrew\/bin\/pinentry-touchid/d' $gpg_agent_conf
          end

          killall gpg-agent

          cat $gpg_conf
          cat $gpg_agent_conf
        case '*'
            echo "Unknown script"
            return 1
    end
end 

