# modules/mac/apps/photo.nix
{ config, lib, ... }:
lib.mkIf config.apps.photo.enable {
  homebrew.masApps = {
    "Acorn" = 6737921844;
#Affinity not really able to be installed this way anymore
    "Affinity Designer 2" = 1616831348;
    "Affinity Photo 2" = 1616822987;
  };

  homebrew.casks = [
    affinity # New Version ;w;
  ];
}