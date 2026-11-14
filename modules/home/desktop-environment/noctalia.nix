# modules/home/desktop-environment/noctalia.nix
{ config, inputs, lib, pkgs, ... }: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  options.programs.custom-noctalia = {
    enable = lib.mkEnableOption "Noctalia";
  };

  config = lib.mkIf (pkgs.stdenv.isLinux && config.desktop.enable && config.programs.custom-noctalia.enable) {
    programs.noctalia = {
      enable = true;
      settings = builtins.fromTOML (builtins.readFile ./noctalia-config.toml);
    };
  };
}