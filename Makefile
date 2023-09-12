.PHONY: install

PACKAGES = X11 bin fontconfig git i3 kitty mail nix nvim polybar rofi tig tmux zsh

install:
	for i in $(PACKAGES) ; do \
		echo "Stowing package $${i}" ; \
		stow -t $${HOME} -v $${i} ; \
	done
