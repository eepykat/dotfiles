# hosts/catbook/default.nix
{ config, pkgs, lib, mainUser, inputs, ... }: {
  imports = [
    ../../modules/mac
  ];

  apps.enable = true;

  mac = {
    defaults.enable = true;
    homebrew.enable = true;
    touchid.enable = true;
    omniwm.enable = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs mainUser; };

    users.${mainUser.user} = { config, lib, pkgs, ... }: {
      imports = [
        ../../modules/home
      ];
      desktop.enable = true;
      terminal.enable = true;
      kitty.enable = true;
    };
  };
}
