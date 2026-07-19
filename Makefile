.PHONY: install

PACKAGES = bin git i3 kitty nvim polybar rofi tig tmux zsh

install:
	for i in $(PACKAGES) ; do \
		echo "Stowing package $${i}" ; \
		stow -t $${HOME} -v $${i} ; \
	done
