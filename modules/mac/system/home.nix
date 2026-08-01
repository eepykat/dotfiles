# modules/mac/system/home.nix
{ inputs, userConfig, ... }: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.${userConfig.user} = {
      imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];
      home.stateVersion = "24.11";
      
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
  };
}