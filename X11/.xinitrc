# Disable DPMS turning off the screen
xset -dpms
xset s off

# Disable bell
xset -b

# Enable zapping (C-A-<Bksp> kills X)
setxkbmap fr -option terminate:ctrl_alt_bksp

# Set background color
xsetroot -solid "#333333"

# Enable core dumps in case something goes wrong
ulimit -c unlimited

exec /usr/bin/dbus-run-session /usr/bin/i3
