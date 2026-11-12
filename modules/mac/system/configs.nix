# /modules/mac/system/configs.nix
{ inputs, userConfig, ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {

    NSGlobalDomain = {
      _HIHideMenuBar = true;
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;
      AppleShowScrollBars = "WhenScrolling";
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
      NSNavPanelExpandedStateForSaveMode = true;
      PMPrintingExpandedStateForPrint = true;
      
    };

    finder = {
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowStatusBar = true;
      FXPreferredViewStyle = "Nlsv";
      FXDefaultSearchScope = "SCcf";
      FXEnableExtensionChangeWarning = false;
      _FXSortFoldersFirst = true;
      QuitMenuItem = true;
    };

    trackpad = {
      Clicking = true;
      TrackpadRightClick = true;
      TrackpadThreeFingerDrag = true;
    };

    menuExtraClock = {
      Show24Hour = true;
      ShowSeconds = false;
      ShowDayOfWeek = true;
    };
    controlcenter = {
      BatteryShowPercentage = true;
      Bluetooth = false;
      Sound = false;
    };

    screencapture = {
      location = "/Users/kat5/Desktop/Screenshots";
      type = "png";
      disable-shadow = true;
    };

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
        "/Users/kat5/Downloads"
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
