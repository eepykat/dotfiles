# modules/mac/apps/audio.nix
{ config, lib, ... }:
lib.mkIf config.apps.audio.enable {
  homebrew.masApps = {
    "Logic Pro" = 634148309;
  };
  homebrew.casks = [
    "fission"
    "mediahuman-audio-converter"
    "musicbrainz-picard"
  ];
}