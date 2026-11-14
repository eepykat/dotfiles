# hosts/catbook/default.nix
{ config, pkgs, lib, mainUser, inputs, ... }: {
  imports = [
    ../../modules/system
    ../../modules/desktop
    ../../modules/system/macos
  ];

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
    mail.enable = true;
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
    enable = true;

    blockbench.enable = true;
    mac-gayming.enable = true;
    pokemmo.enable = false;
    prismlauncher.enable = true;
    roblox.enable = false;
    steam.enable = true;
  };

  system = {
    stateVersion = 7;
    primaryUser = mainUser.user;
  };

  users.users.${mainUser.user} = {
    name = mainUser.user;
    home = "/Users/${mainUser.user}";
  };


  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs mainUser; };

    users.${mainUser.user} = { config, lib, pkgs, ... }: {
      imports = [
        ../../modules/home
      ];

      # Home Manager Toggles
      desktop.enable = false;
      omniwm.enable = true;
      terminal.enable = true;
      kitty.enable = true;
    };
  };
}
