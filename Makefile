.PHONY: install

PACKAGES = X11 bin git i3 mail nvim rofi tig tmux zsh

install:
	for i in $(PACKAGES) ; do \
		echo "Stowing package $${i}" ; \
		stow -t $${HOME} -v $${i} ; \
	done
