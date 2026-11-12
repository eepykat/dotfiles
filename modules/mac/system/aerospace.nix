# /modules/mac/system/aerospace.nix
{ inputs, userConfig, ... }: {
  services.aerospace = {
    enable = true;
    settings = {
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      accordion-padding = 30;

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];
      on-focus-changed = [ "move-mouse window-lazy-center" ];

      gaps = {
        inner = { horizontal = 10; vertical = 10; };
        outer = { left = 10; bottom = 10; top = 10; right = 10; };
      };

      mode.main.binding = {
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";

        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";
        alt-f = "fullscreen";
        alt-shift-space = "layout floating tiling";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";
        alt-shift-4 = "move-node-to-workspace 4";
        alt-shift-5 = "move-node-to-workspace 5";

        alt-shift-c = "reload-config";
      };

      on-window-detected = [
        {
          "if".app-id = "net.kovidgoyal.kitty";
          run = [ "move-node-to-workspace 1" ];
        }
        {
          "if".app-id = "com.apple.systempreferences";
          run = [ "layout floating" ];
        }
        {
          "if".app-id = "com.apple.finder";
          run = [ "layout floating" ];
        }
      ];
    };
  };

  services.jankyborders = {
    enable = true;
    active_color = "0xffcba6f7";
    inactive_color = "0xff313244";
    width = 4.0;
    style = "round";
    hidpi = true;
  };
}