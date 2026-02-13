# carapace.nu — Universal completions (500+ tools)
# Install: brew install carapace

export-env {
    let carapace_completer = {|spans: list<string>|
        # Resolve alias to real command
        let expanded_alias = (
            scope aliases
            | where name == $spans.0
            | get -o 0
            | get -o expansion
        )

        let spans = if $expanded_alias != null {
            $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
        } else {
            $spans
        }

        carapace $spans.0 nushell ...$spans | from json
    }

    $env.config = ($env.config | merge deep {
        completions: {
            external: {
                enable: true
                completer: $carapace_completer
            }
        }
    })
}
