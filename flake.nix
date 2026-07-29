# flake.nix
{
  description = "meowOS v1";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    niri.url = "github:sodiboo/niri-flake";
    home-manager.url = "github:nix-community/home-manager";
    catppuccin.url = "github:catppuccin/nix";
    flatpak.url = "github:gmodena/nix-flatpak/latest";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/legacy-v4";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs:
  let
  mainUser = {
    user = "kat5"; # ${mainUser.user}
    name = "Katarina";
  }; 
  in {
    nixosConfigurations = {
#    =======================
#            Meowpad
#    =======================
        "meowpad" = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs mainUser; };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.flatpak.nixosModules.nix-flatpak
            ./hosts/meowpad
            {
              nixpkgs.overlays = [ inputs.millennium.overlays.default ];
              nixpkgs.config.permittedInsecurePackages = [ "electron-39.8.10" ];} 
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs mainUser; };

              }
          ];
        };
#    =======================
#            Lunchbox
#    =======================
        "lunchbox" = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs mainUser; };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            inputs.flatpak.nixosModules.nix-flatpak
            ./hosts/lunchbox
            {
              nixpkgs.overlays = [ inputs.millennium.overlays.default ];
              nixpkgs.config.permittedInsecurePackages = [ "electron-39.8.10" ];} 
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = { inherit inputs mainUser; };

              }
          ];
        };
#    =======================
#       Server for later
#    =======================
        "generic-server" = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/server
            {
              nixpkgs.overlays = [ ];
              nixpkgs.config.permittedInsecurePackages = [ ];
            }
          ];
        };
      };
      darwinConfigurations = {
        "catbook" = inputs.nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin"; 
          specialArgs = { inherit inputs mainUser; userConfig = mainUser; };
          modules = [
            inputs.home-manager.darwinModules.home-manager
            ./hosts/catbook
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs mainUser; };
            }
          ];
        };
    };
  };
}