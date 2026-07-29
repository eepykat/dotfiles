# modules/mac/apps/security.nix
{ config, lib, ... }:
lib.mkIf config.apps.security.enable {
  homebrew.masApps = {
    "Bitwarden" = 1352778147;
    "Yubico Authenticator" = 1497506650;
  };

  homebrew.casks = [
    "proton-pass"
  ];
}
