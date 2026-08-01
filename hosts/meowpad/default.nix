{ config, pkgs, lib, mainUser, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/global
    ../../modules/desktop
  ];
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "meowpad";

  time.timeZone = "Europe/Vilnius"; # Lithuanian Time
  i18n.defaultLocale = "en_US.UTF-8";

  # Toggles
  podman.enable = false;
  flatpak.enable = true;
  default-users.enable = true;
  vpn.enable = true;
  desktop-networking.enable = true;
  system.audio.enable = true;
  nix-extra-misc.enable = true;
  laptop-power.enable = true;
  system.garbage.enable = true;
  cellular.enable = true;
  steam.enable = false;

  home-manager.users.${mainUser.user} = { config, lib, pkgs, inputs, ... }: {
    imports = [
      ../../modules/home
    ];

    desktop.enable = true;

    terminal.enable = true;
    programs.custom-niri.enable = true;
    programs.custom-noctalia.enable = true;
  
  };
}
