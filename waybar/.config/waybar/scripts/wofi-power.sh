
#!/bin/bash

chosen=$(echo -e "Shutdown\nReboot\nLock\nSuspend\nLogout" | wofi --dmenu --cache-file /dev/null)

case "$chosen" in
  Shutdown)
    systemctl poweroff
    ;;
  Reboot)
    systemctl reboot
    ;;
  Lock)
    hyprlock  # Or replace with your lock command
    ;;
  Suspend)
    systemctl suspend
    ;;
  Logout)
    hyprctl dispatch exit
    ;;
esac
