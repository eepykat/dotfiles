# flake.nix
{
  description = "meowOS v1";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
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
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

  };
  outputs = inputs:
  let
  mainUser = {
    user = "kat5"; # ${mainUser.user}
    name = "Katarina";
  };
  macUser = {
    user = "catbook"; # ${macUser.user}
    name = "Katarina";
  };
  macMiniUser = {
    user = "cat5"; # ${macMiniUser.user}
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
#         Deployment
#    =======================
        "deployment" = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs mainUser; };
          modules = [
            inputs.home-manager.nixosModules.home-manager
            ./hosts/deployment
            {
              nixpkgs.overlays = [ ];
              nixpkgs.config.permittedInsecurePackages = [ ];} 
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
          specialArgs = { inherit inputs mainUser; userConfig = macUser; };
          modules = [
            inputs.home-manager.darwinModules.home-manager
            inputs.nix-homebrew.darwinModules.nix-homebrew
            ./hosts/catbook
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs mainUser; };
            }
          ];
        };
        "catmini" = inputs.nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin"; 
          specialArgs = { inherit inputs mainUser; userConfig = macMiniUser; };
          modules = [
            inputs.home-manager.darwinModules.home-manager
            inputs.nix-homebrew.darwinModules.nix-homebrew
            ./hosts/catmini
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