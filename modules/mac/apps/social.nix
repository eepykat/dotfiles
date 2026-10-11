# modules/mac/apps/social.nix
{ config, lib, ... }:
lib.mkIf config.apps.social.enable {
  homebrew.masApps = {
    "Telegram" = 747648890;
  };
  environment.systemPackages = [
    pkgs.cinny-desktop

  ];

  homebrew.casks = [
    "element"
    "vesktop"
  ];
}
