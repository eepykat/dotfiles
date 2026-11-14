# modules/home/default.nix
{ config, lib, pkgs, mainUser, ... }: {
  imports = [
    ./system
    ./desktop-environment
  ];

  options = {
    desktop.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable graphical desktop home-manager modules.";
    };
  };

  config = {
    home = {
      username = mainUser.user;
      homeDirectory =
        if pkgs.stdenv.hostPlatform.isDarwin
        then "/Users/${mainUser.user}"
        else "/home/${mainUser.user}";
      stateVersion = "24.11";
    };
  };
}