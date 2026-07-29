# modules/mac/apps/vpn.nix
{ config, lib, ... }:
lib.mkIf config.apps.vpn.enable {
  homebrew.masApps = {
    "WireGuard" = 1451685025;
  };

  homebrew.casks = [
    "protonvpn"
  ];
}