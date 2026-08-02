# modules/mac/apps/development.nix
{ config, lib, ... }:
lib.mkIf config.apps.development.enable {
  homebrew.casks = [
    "beekeeper-studio"
    "github"
    "nova"
    "vscodium"
    "transmit"

  ];
}
