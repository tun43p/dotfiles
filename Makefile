.PHONY: link

link:
	rm -rf $(HOME)/.config/fish
	rm -rf $(HOME)/.config/nvim

	ln -sf $(PWD)/fish $(HOME)/.config/fish
	ln -sf $(PWD)/git/gitconfig $(HOME)/.gitconfig
	ln -sf $(PWD)/nvim $(HOME)/.config/nvim
	ln -sf $(PWD)/tmux/tmux.conf $(HOME)/.tmux.conf