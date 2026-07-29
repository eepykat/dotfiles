# modules/mac/apps/mail.nix
{ config, lib, ... }:
lib.mkIf config.apps.mail.enable {
  homebrew.masApps = {
    "Canary Mail" = 1236045954;
  };

  homebrew.casks = [

  ];
}
