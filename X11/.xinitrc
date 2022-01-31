# Disable DPMS turning off the screen
xset -dpms
xset s off

# Disable bell
xset -b

# Enable zapping (C-A-<Bksp> kills X)
setxkbmap fr -option terminate:ctrl_alt_bksp

# Enforce correct locales from the beginning
unset LC_COLLATE
export LC_CTYPE=en_US.utf8
export LC_TIME=en_US.utf8
export LC_NUMERIC=en_US.utf8
export LC_MONETARY=en_US.utf8
export LC_MESSAGES=C
export LC_PAPER=en_US.utf8
export LC_NAME=en_US.utf8
export LC_ADDRESS=en_US.utf8
export LC_TELEPHONE=en_US.utf8
export LC_MEASUREMENT=en_US.utf8
export LC_IDENTIFICATION=en_US.utf8
export PATH=/home/kdecherf/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

# Use XToolkit in java applications
export AWT_TOOLKIT=XToolkit

# Set background color
xsetroot -solid "#333333"

# Enable core dumps in case something goes wrong
ulimit -c unlimited

# Start i3 and log to ~/.i3/logfile
echo "Starting at $(date)" >> ~/.i3.log
exec /usr/bin/i3
