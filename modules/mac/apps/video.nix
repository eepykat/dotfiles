# modules/mac/apps/video.nix
{ config, lib, ... }:
lib.mkIf config.apps.video.enable {
  homebrew.masApps = {
    "Claquette" = 587748131;
    "Compressor" = 424390742;
    "DaVinci Resolve" = 571213070;
    "Final Cut Pro" = 424389933;
    "Motion" = 434290957;
    "LosslessCut" = 1505323402;
    "Captionator" = 1627843786;

  };

  homebrew.casks = [
    "handbrake"
    "obs"
  ];
}