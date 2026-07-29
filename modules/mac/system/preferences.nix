# modules/mac/system/preferences.nix
{ pkgs, userConfig, ... }: {
  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
    '';
  };

  users.users.${userConfig.user} = {
    shell = pkgs.fish;
  };

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;
      "com.apple.sound.uiaudio.enabled" = 0;
    };

    dock = {
      autohide = true;
      show-recents = false;
      tilesize = 48;
    };

    finder = {
      AppleShowAllFiles = true;
      FXPreferredViewStyle = "Nlsv";
      ShowPathbar = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
}