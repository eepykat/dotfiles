# modules/mac/apps/print.nix
{ config, lib, ... }:
lib.mkIf config.apps.print.enable {
  homebrew.casks = [
    "orcaslicer"
    "prusaslicer"
    #"blender"
  ];
}
