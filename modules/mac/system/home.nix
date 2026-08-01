# modules/mac/system/home.nix
{ inputs, userConfig, ... }: {
  home-manager.users.${userConfig.user} = {
    imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];
    home.stateVersion = "24.11";
    useUserPackages = true;
    useGlobalPkgs = true;

    
    catppuccin = {
      enable = true;
      flavor = "mocha";
    };

    programs = {
      starship = {
        enable = true;
      };
      fish = {
        enable = true;
      };
    };
  };
}