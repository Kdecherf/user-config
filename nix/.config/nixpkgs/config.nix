{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    fujitaka = pkgs.buildEnv {
      name = "fujitaka-packages";
      paths = [
        bat
        bottom
        chromium
        diff-so-fancy
        dive
        docker-compose
        duc
        firefox
        font-awesome
        fzf
        git
        gnupg
        homebank
        isync
        material-design-icons
        material-icons
        msmtp
        mupdf
        neomutt
        neovim
        nextcloud-client
        nix
        nodejs
        notmuch
        notmuch-addrlookup
        noto-fonts-emoji
        pass
        pavucontrol
        polybarFull
        poppler_utils
        pwgen
        restic
        rxvt-unicode
        sarasa-gothic
        scrot
        silver-searcher
        spotify
        stow
        symbola
        tdesktop
        tig
        tmux
        tree
        vscode
        yarn
        zsh
      ];
    };
  };
}
