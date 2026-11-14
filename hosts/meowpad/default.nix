# hosts/meowpad/default.nix
{ config, pkgs, lib, mainUser, inputs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/system
    ../../modules/system/linux
    ../../modules/desktop
    ../../modules/desktop/linux
    ../global.nix
  ];

  # System Toggles
  podman.enable = false;
  flatpak.enable = true;
  default-users.enable = true;
  vpn.enable = false;
  desktop-networking.enable = true;
  system.audio.enable = true;
  laptop-power.enable = true;
  cellular.enable = false;

  # Desktop Programs Toggles
  desktop.programs = {
    enable = true;

    audio.enable = true;
    books.enable = true;
    browsers.enable = true;
    chat.enable = true;
    creative.enable = true;
    desktop.enable = true;
    development.enable = true;
    files.enable = true;
    mail.enable = false;
    music.enable = true;
    office.enable = true;
    print.enable = true;
    security.enable = true;
    system.enable = true;
    video.enable = true;
    virtualization.enable = true;
    vpn.enable = true;
  };

  # Gaming Toggles
  gayming = {
    enable = false;

    steam.enable = false;
    blockbench.enable = true;
    hydra-launcher.enable = true;
    pokemmo.enable = true;
    prismlauncher.enable = true;
    roblox.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs mainUser; };
    users.${mainUser.user} = { config, lib, pkgs, ... }: {
      imports = [
        ../../modules/home
      ];

      # Home Manager Toggles
      desktop.enable = true;
      terminal.enable = true;
      kitty.enable = true;
      cursor.enable = true;
      umbriel.enable = true;
      programs.custom-noctalia.enable = true;
    };
  };
}
