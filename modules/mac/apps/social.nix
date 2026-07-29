# modules/mac/apps/social.nix
{ config, lib, ... }:
lib.mkIf config.apps.social.enable {
  homebrew.masApps = {
    "Telegram" = 747648890;
  };
  
  homebrew.casks = [
    "element"
    "vesktop"
  ];
}
