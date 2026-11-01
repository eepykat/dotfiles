# modules/home/desktop-environment/noctalia.nix
{ config, inputs, lib, pkgs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  options.programs.custom-noctalia = {
    enable = lib.mkEnableOption "Noctalia";
  };

  
  config = lib.mkIf (config.desktop.enable && config.programs.custom-noctalia.enable) {
    programs.noctalia = {
      enable = true;

      settings = { # This may also be a string or path to a .toml file.
        theme = {
          mode = "dark";
          source = "builtin";
          builtin = "Catppuccin";
        };

        wallpaper = {
          enabled = true;
          default.path = "/path/to/wallpapers/wallpaper.png";
        };
      };
    };
  };
}