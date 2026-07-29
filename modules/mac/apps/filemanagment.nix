# modules/mac/apps/filemanagment.nix
{ config, lib, ... }:
lib.mkIf config.apps.filemanagment.enable {
  homebrew.masApps = {
    "Keka" = 470158793;
    "FileBot" = 905384638;
  };

  homebrew.casks = [
    "localsend"
    "proton-drive"
  ];
}
