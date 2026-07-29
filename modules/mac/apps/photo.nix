# modules/mac/apps/photo.nix
{ config, lib, ... }:
lib.mkIf config.apps.photo.enable {
  homebrew.masApps = {
    "Acorn" = 6737921844;
    "Affinity Designer 2" = 1616831348;
    "Affinity Photo 2" = 1616822987;
  };

  homebrew.casks = [

  ];
}