# modules/mac/apps/stickers.nix
{ config, lib, ... }:
lib.mkIf config.apps.stickers.enable {
  homebrew.casks = [
    "silhouette-studio"
  ];
}
