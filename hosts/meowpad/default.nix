{ config, pkgs, lib, mainUser, inputs, ... }: {

  imports = [
    ./hardware-configuration.nix
    ../../modules/global
    ../../modules/desktop
  ];
  
  # Bunch of fill ins
  system.stateVersion = "25.11";
  nixpkgs.config.allowUnfree = true;
  networking.hostName = "meowpad";
  time.timeZone = "Europe/Vilnius";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IE.UTF-8";
    LC_IDENTIFICATION = "en_IE.UTF-8";
    LC_MEASUREMENT = "en_IE.UTF-8";
    LC_MONETARY = "en_IE.UTF-8";
    LC_NAME = "en_IE.UTF-8";
    LC_NUMERIC = "en_IE.UTF-8";
    LC_PAPER = "en_IE.UTF-8";
    LC_TELEPHONE = "en_IE.UTF-8";
    LC_TIME = "en_DK.UTF-8";
  };

  users.users.${mainUser.user} = {
    shell = pkgs.fish;
    ignoreShellProgramCheck = true; 
  };

  # Toggles
  podman.enable = true;
  flatpak.enable = true;
  default-users.enable = true;
  vpn.enable = false;
  desktop-networking.enable = true;
  system.audio.enable = true;
  nix-extra-misc.enable = true;
  laptop-power.enable = true;
  system.garbage.enable = true;
  cellular.enable = true;
  steam.enable = false;

  home-manager = {
    extraSpecialArgs = { inherit inputs mainUser; };

    users.${mainUser.user} = { config, lib, pkgs, ... }: {

      imports = [
        ../../modules/home
      ];
      desktop.enable = true;
      terminal.enable = true;
      programs.custom-noctalia.enable = true;
    };
  };
}