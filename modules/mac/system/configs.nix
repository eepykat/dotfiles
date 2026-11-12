# /modules/mac/system/configs.nix
{ inputs, userConfig, ... }: {
  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
      autohide-time-modifier = 0.15;
      orientation = "bottom";
      tilesize = 48;
      magnification = false;

      show-recents = false;
      show-process-indicators = true;
      launchanim = false;
      mineffect = "scale";
      minimize-to-application = true;

      mru-spaces = false;
      expose-group-apps = true;

      persistent-apps = [
        "/Applications/Safari.app"
        "/System/Applications/System Settings.app"
      ];
      persistent-others = [
        "/Users/${userConfig.username}/Downloads"
      ];

      wvous-tl-corner = 1;
      wvous-tr-corner = 1;
      wvous-bl-corner = 1;
      wvous-br-corner = 1;
    };

    CustomUserPreferences = {
      "com.apple.symbolichotkeys" = {
        AppleSymbolicHotKeys = {
          "64" = { enabled = false; };
        };
      };
    };
  };
}
