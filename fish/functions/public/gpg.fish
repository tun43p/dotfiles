function gpgex -d "Export private and public GPG keys."
    if test (count $argv) -lt 1; or test $argv[1] = --help
        echo "Export private and public GPG keys."
        echo "Usage: gpgex [identifier]"
		else
				set id $argv[1]
				gpg --export -a $id > ~/.gpg/$id-public.key
				gpg --export-secret-key -a $id > ~/.gpg/$id-private.key
		end
end
