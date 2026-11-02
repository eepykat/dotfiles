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

      settings = "./noctalia-config.toml"

        wallpaper = {
          enabled = true;
          default.path = "/home/kat5/Pictures/Wallpapers";
        };
    };
  };
}