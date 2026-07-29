# modules/home/desktop-environment/niri.nix
{ config, inputs, lib, pkgs, ... }: {
  imports = [
    inputs.niri.homeModules.niri
  ];
  options.programs.custom-niri = {
    enable = lib.mkEnableOption "niri";
  };
  config = lib.mkIf (config.desktop.enable && config.programs.custom-niri.enable) {

    home.packages = with pkgs; [
      xwayland-satellite
    ];

    programs.niri = {
      enable = true;
      settings = {
        spawn-at-startup = [
          { command = [ "noctalia-shell" ]; }
          { command = [ "dbus-update-activation-environment" "--systemd" "DISPLAY" "WAYLAND_DISPLAY" "XAUTHORITY" ]; }
        ];
        layout = {
          gaps = 16;
        };

        environment = {
          DISPLAY = ":0";
        };

        switch-events = {
          lid-close.action.spawn = [ "noctalia-shell" "ipc" "call" "lockScreen" "lock" ];
        };


        binds = with config.niri.lib.actions; {
          "Mod+Space".action.spawn = [ "noctalia-shell" "ipc" "call" "launcher" "toggle" ];
          "Mod+T".action.spawn = [ "kitty" ];
          "Mod+L".action.spawn = [ "noctalia-shell" "ipc" "call" "lockScreen" "lock" ];
          
          "Mod+Q".action.close-window = { };
          "Print".action.screenshot-window = { };
          "Mod+Escape".action.toggle-keyboard-shortcuts-inhibit = { };
          "Mod+Shift+Q".action.quit = { }; 
          "Mod+Left".action.focus-column-left = { };
          "Mod+Right".action.focus-column-right = { };      
          "Mod+Down".action.focus-workspace-down = { };
          "Mod+Up".action.focus-workspace-up = { };
        };

        input = {
          keyboard.xkb = {
            layout = "us";
            options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps";
          };
          touchpad = {
            tap = true;
            scroll-method = "two-finger";
            disabled-on-external-mouse = true;
          };
          warp-mouse-to-focus.enable = true;
        };
      };
    };
  };
}
