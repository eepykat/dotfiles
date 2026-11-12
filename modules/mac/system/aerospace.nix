# modules/mac/system/aerpspace.nix
{ inputs, userConfig, ... }: {
    
    services.aerospace = {
    enable = true;
    settings = {
      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;
      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";
      
      gaps = {
        inner = { horizontal = 8; vertical = 8; };
        outer = { left = 8; bottom = 8; top = 8; right = 8; };
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

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";

        alt-shift-1 = "move-node-to-workspace 1";
        alt-shift-2 = "move-node-to-workspace 2";
        alt-shift-3 = "move-node-to-workspace 3";

        alt-shift-space = "layout floating tiling";
        alt-shift-c = "reload-config";
      };

      on-window-detected = [
        {
          "if".app-id = "com.mitchellh.ghostty";
          run = [ "move-node-to-workspace 1" ];
        }
        {
          "if".app-id = "com.apple.Safari";
          run = [ "move-node-to-workspace 2" ];
        }
      ];
    };
  };


}