#exec twm
#exec gnome-session --session=gnome-classic
#setxkbmap -option compose:ralt
#exec gnome-session
setxkbmap pl

# https://bbs.archlinux.org/viewtopic.php?pid=1377008#p1377008
# https://wiki.archlinux.org/index.php/dwm
while true; do

DWM_VOL=$( amixer -c0 sget Master | awk -vORS=' ' '/Mono:/{print($6$4)}' | sed -e 's/]\[/ /g' -e 's/\[//g' -e 's/]//g');
DWM_CLOCK=$( date '+%e %b %Y %a %H:%M');

DWM_STATUS="$DWM_VOL $DWM_CLOCK";
xsetroot -name "$DWM_STATUS";

sleep 1s;

done &

#Set chrome as default browser
if [ -n "$DISPLAY" ]; then
	BROWSER=google-chrome
	TERM=gnome-terminal
fi
exec dwm
