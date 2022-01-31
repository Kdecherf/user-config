emulate zsh
setopt autocd c_bases octal_zeroes extended_glob nonomatch noglobal_rcs

if [ -e /home/kdecherf/.nix-profile/etc/profile.d/nix.sh ]; then . /home/kdecherf/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
