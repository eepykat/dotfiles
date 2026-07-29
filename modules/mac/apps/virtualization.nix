# modules/mac/apps/virtualization.nix
{ config, lib, ... }:
lib.mkIf config.apps.virtualization.enable {
  homebrew.masApps = {
    "CrystalFetch" = 6454431289;
    "UTM" = 1538878817;
  };

  homebrew.casks = [

  ];
}
