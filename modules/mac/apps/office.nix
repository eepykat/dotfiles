# modules/mac/apps/office.nix
{ config, lib, ... }:
lib.mkIf config.apps.office.enable {
  homebrew.masApps = {
    "Supernote Partner" = 1494992020;
    "LibreOffice" = 1630474372;
    "Microsoft Outlook" = 985367838;
  };
  
  homebrew.casks = [
    "obsidian"
  ];
}
