# modules/mac/system/sketchybar.nix
{ pkgs, ... }:
let
  aerospaceScript = pkgs.writeShellScript "aerospace.sh" ''
    if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
      sketchybar --set "$NAME" background.drawing=on background.color=0xff7aa2f7 label.color=0xff1a1b26
    else
      sketchybar --set "$NAME" background.drawing=off label.color=0xffc0caf5
    fi
  '';

  frontAppScript = pkgs.writeShellScript "front_app.sh" ''
    [ "$SENDER" = "front_app_switched" ] && sketchybar --set "$NAME" label="$INFO"
  '';

  volumeScript = pkgs.writeShellScript "volume.sh" ''
    VOL=$(osascript -e 'output volume of (get volume settings)')
    MUTED=$(osascript -e 'output muted of (get volume settings)')
    if [ "$MUTED" = "true" ]; then
      sketchybar --set "$NAME" label="Vol: Muted"
    else
      sketchybar --set "$NAME" label="Vol: $VOL%"
    fi
  '';

  wifiScript = pkgs.writeShellScript "wifi.sh" ''
    SSID=$(networksetup -getairportnetwork en0 2>/dev/null | awk -F': ' '{print $2}')
    if [ -n "$SSID" ]; then
      sketchybar --set "$NAME" label="Wi-Fi: $SSID"
    else
      sketchybar --set "$NAME" label="Wi-Fi: Off"
    fi
  '';

  batteryScript = pkgs.writeShellScript "battery.sh" ''
    PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
    CHARGING=$(pmset -g batt | grep 'AC Power')
    [ -z "$PERCENTAGE" ] && exit 0
    if [ -n "$CHARGING" ]; then
      sketchybar --set "$NAME" label="Bat: $PERCENTAGE%+"
    else
      sketchybar --set "$NAME" label="Bat: $PERCENTAGE%"
    fi
  '';

  clockScript = pkgs.writeShellScript "clock.sh" ''
    sketchybar --set "$NAME" label="$(date '+%a %d %b  %H:%M')"
  '';
in
{
  services.sketchybar = {
    enable = true;
    extraPackages = [ pkgs.aerospace ];
    config = ''
      sketchybar --bar \
        height=32 \
        position=top \
        padding_left=10 \
        padding_right=10 \
        color=0xcc1a1b26 \
        blur_radius=20 \
        hidden=on

      sketchybar --default \
        icon.drawing=off \
        label.font="SF Pro:Semibold:13.0" \
        label.color=0xffc0caf5 \
        padding_left=8 \
        padding_right=8 \
        background.corner_radius=6 \
        background.height=24

      sketchybar --add event aerospace_workspace_change
      for sid in 1 2 3 4 5; do
        sketchybar --add item space.$sid left \
          --subscribe space.$sid aerospace_workspace_change \
          --set space.$sid \
            label="$sid" \
            click_script="aerospace workspace $sid" \
            script="${aerospaceScript} $sid"
      done

      sketchybar --add item front_app left \
        --set front_app \
          label.font="SF Pro:Bold:13.0" \
          script="${frontAppScript}" \
        --subscribe front_app front_app_switched

      sketchybar --add item clock right \
        --set clock update_freq=10 script="${clockScript}"

      sketchybar --add item battery right \
        --set battery update_freq=60 script="${batteryScript}" \
        --subscribe battery system_woke power_source_change

      sketchybar --add item wifi right \
        --set wifi update_freq=30 script="${wifiScript}" \
        --subscribe wifi wifi_change

      sketchybar --add item volume right \
        --set volume script="${volumeScript}" \
        --subscribe volume volume_change

      sketchybar --update
    '';
  };
}