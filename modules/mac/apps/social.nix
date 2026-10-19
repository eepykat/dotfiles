# modules/mac/apps/social.nix
{ config, lib, pkgs, ... }:
lib.mkIf config.apps.social.enable {
  homebrew.masApps = {
    "Telegram" = 747648890;
    "WhatsApp" = 310633997;
  };
  environment.systemPackages = [
    pkgs.cinny-desktop

  ];

  homebrew.casks = [
    "element"
    "vesktop"
  ];
}
