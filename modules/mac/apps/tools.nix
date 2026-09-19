# modules/mac/apps/tools.nix
{ config, lib, ... }:
lib.mkIf config.apps.tools.enable {
  homebrew.casks = [
    #"moonlight"
    #"syncthing-app"
  ];
}
