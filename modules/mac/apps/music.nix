# modules/mac/apps/music.nix
{ config, lib, ... }:
lib.mkIf config.apps.music.enable {
  homebrew.masApps = {
  };
  
  homebrew.casks = [
    "spotify"
  ];
}
