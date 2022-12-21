#!/usr/bin/fish

if status is-interactive
	set -gx SHELL /usr/bin/fish
	set -gx TERMINAL urxvt
	set -gx EDITOR nvim
	set -gx VISUAL code 
	set -gx BROWSER firefox
	set -gx CHROME_EXECUTABLE chromium

	set -gx LOCAL $HOME/.local
	set -gx REPOS $HOME/documents/repositories
	set -gx DOTS $REPOS/github.com/tun43p/dotfiles
	set -gx SCRIPTS $DOTS/scripts
	
	set -gx QT_QPA_PLATFORMTHEME qt5ct
	set -gx GTK2_RC_FILES $HOME/.gtkrc-2.0

	set -gx JAVA_HOME /usr/lib/jvm/java-8-openjdk
	set -gx ANDROID_SDK_ROOT $LOCAL/opt/android-sdk
	set -gx ANDROID_SDK_BIN $ANDROID_SDK_ROOT/cmdline-tools/latest/bin $ANDROID_SDK_ROOT/platform-tools

	set -gx CARGO_HOME $HOME/.cargo

	set -gx GOPATH $HOME/.go
	set -gx GOBIN $GOPATH/bin

	set -gx PYENV_ROOT $HOME/.pyenv
	set -gx PYTHON_BIN $HOME/.pyenv/versions/3.10.6/bin

	set -U fish_user_paths \
		$LOCAL/bin \
		$GOBIN \
		$CARGO_HOME/bin \
		$ANDROID_SDK_BIN \
		$PYENV_ROOT/bin \
		$fish_user_paths

	alias dots "cd $DOTS"
	alias repos "cd $REPOS"

	# TODO: Add other pyenv binaries here and find another solution	
	# alias python="$HOME/.pyenv/versions/3.10.6/bin/python"
	# alias python3="$HOME/.pyenv/versions/3.10.6/bin/python3"
	# alias pip="$HOME/.pyenv/versions/3.10.6/bin/pip"
	# alias pip3="$HOME/.pyenv/versions/3.10.6/bin/pip3"

	pyenv init - | source
end
