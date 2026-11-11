{ config, pkgs, lib, mainUser, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/global
    ../../modules/desktop
    ../global.nix
  ];

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
      # Home Manager Toggles
      desktop.enable = true;
      terminal.enable = true;
      programs.custom-noctalia.enable = true;
    };
  };
}