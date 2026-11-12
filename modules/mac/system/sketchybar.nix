# modules/mac/system/sketchybar.nix
{ pkgs, ... }:

let
  base     = "0xee1e1e2e";
  surface0 = "0xff313244";
  text     = "0xffcdd6f4";
  mauve    = "0xffcba6f7";
  blue     = "0xff89b4fa";
  teal     = "0xff94e2d5";
  peach    = "0xfffab387";
  red      = "0xfff38ba8";

  aerospaceScript = pkgs.writeShellScript "aerospace.sh" ''
    if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
      sketchybar --set "$NAME" \
        background.drawing=on \
        background.color=${mauve} \
        label.color=0xff1e1e2e
    else
      sketchybar --set "$NAME" \
        background.drawing=on \
        background.color=${surface0} \
        label.color=${text}
    fi
  '';

  frontAppScript = pkgs.writeShellScript "front_app.sh" ''
    if [ "$SENDER" = "front_app_switched" ]; then
      sketchybar --set "$NAME" label="$INFO"
    fi
  '';

  volumeScript = pkgs.writeShellScript "volume.sh" ''
    VOL=$(osascript -e 'output volume of (get volume settings)')
    MUTED=$(osascript -e 'output muted of (get volume settings)')
    if [ "$MUTED" = "true" ] || [ "$VOL" -eq 0 ]; then
      ICON="  "
      LABEL="Muted"
    else
      ICON="  "
      LABEL="$VOL%"
    fi
    sketchybar --set "$NAME" icon="$ICON" label="$LABEL"
  '';

  wifiScript = pkgs.writeShellScript "wifi.sh" ''
    SSID=$(networksetup -getairportnetwork en0 2>/dev/null | awk -F': ' '{print $2}')
    if [ -n "$SSID" ]; then
      sketchybar --set "$NAME" icon="  " label="$SSID"
    else
      sketchybar --set "$NAME" icon="  " label="Offline"
    fi
  '';

  batteryScript = pkgs.writeShellScript "battery.sh" ''
    PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
    CHARGING=$(pmset -g batt | grep 'AC Power')
    [ -z "$PERCENTAGE" ] && exit 0

    if [ -n "$CHARGING" ]; then
      ICON="  "
    elif [ "$PERCENTAGE" -gt 75 ]; then
      ICON="  "
    elif [ "$PERCENTAGE" -gt 40 ]; then
      ICON="  "
    else
      ICON="  "
    fi
    sketchybar --set "$NAME" icon="$ICON" label="$PERCENTAGE%"
  '';

  clockScript = pkgs.writeShellScript "clock.sh" ''
    sketchybar --set "$NAME" icon="  " label="$(date '+%a %d %b  %H:%M')"
  '';
in
{
  services.sketchybar = {
    enable = true;
    extraPackages = [ pkgs.aerospace ];

    config = ''
      sketchybar --bar \
        height=34 \
        position=top \
        margin=10 \
        y_offset=6 \
        corner_radius=10 \
        padding_left=10 \
        padding_right=10 \
        color=${base} \
        blur_radius=20 \
        topmost=on \
        hidden=off

      sketchybar --default \
        icon.font="JetBrainsMono Nerd Font:Bold:15.0" \
        icon.color=${mauve} \
        icon.padding_left=8 \
        icon.padding_right=4 \
        label.font="JetBrainsMono Nerd Font:Bold:13.0" \
        label.color=${text} \
        label.padding_left=4 \
        label.padding_right=8 \
        padding_left=3 \
        padding_right=3 \
        background.color=${surface0} \
        background.corner_radius=8 \
        background.height=24 \
        background.drawing=on

      sketchybar --add event aerospace_workspace_change
      for sid in 1 2 3 4 5 S; do
        sketchybar --add item space.$sid left \
          --subscribe space.$sid aerospace_workspace_change \
          --set space.$sid \
            icon.drawing=off \
            label="$sid" \
            label.padding_left=9 \
            label.padding_right=9 \
            click_script="aerospace workspace $sid" \
            script="${aerospaceScript} $sid"
      done

      sketchybar --add item front_app left \
        --set front_app \
          icon="  " \
          icon.color=${blue} \
          script="${frontAppScript}" \
        --subscribe front_app front_app_switched

      sketchybar --add item clock right \
        --set clock \
          icon.color=${mauve} \
          update_freq=10 \
          script="${clockScript}"

      sketchybar --add item battery right \
        --set battery \
          icon.color=${teal} \
          update_freq=60 \
          script="${batteryScript}" \
        --subscribe battery system_woke power_source_change

      sketchybar --add item wifi right \
        --set wifi \
          icon.color=${blue} \
          update_freq=30 \
          script="${wifiScript}" \
        --subscribe wifi wifi_change

      sketchybar --add item volume right \
        --set volume \
          icon.color=${peach} \
          script="${volumeScript}" \
        --subscribe volume volume_change

      sketchybar --update
    '';
  };
}
