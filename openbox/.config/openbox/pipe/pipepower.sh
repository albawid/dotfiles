#!/bin/bash

nowplaying=$(mpc -p 6601 current | head -1)

echo "<openbox_pipe_menu>"
echo '<separator label=" Power Menu"/>'
echo '<item label="  Logout"><action name="Execute"><execute>i3-msg exit</execute></action></item>'
echo '<item label="  Reboot"><action name="Execute"><execute>systemctl reboot</execute></action></item>'
echo '<item label="  Shutdown"><action name="Execute"><execute>systemctl poweroff</execute></action></item>'
echo '<item label="  Sleep"><action name="Execute"><execute>systemctl suspend</execute></action></item>'
echo "</openbox_pipe_menu>"
