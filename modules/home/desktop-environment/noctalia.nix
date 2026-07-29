# modules/home/desktop-environment/noctalia.nix
{ config, inputs, lib, pkgs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  options.programs.custom-noctalia = {
    enable = lib.mkEnableOption "Noctalia";
  };
  
  config = lib.mkIf (config.desktop.enable && config.programs.custom-noctalia.enable) {
    programs.noctalia-shell = {
      enable = true;
      settings = builtins.fromJSON (builtins.readFile ./noctalia-settings.json);
    };
  };
}