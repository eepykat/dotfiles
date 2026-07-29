# modules/mac/apps/games.nix
{ config, lib, ... }:
lib.mkIf config.apps.games.enable {
  homebrew.masApps = {
  };

  homebrew.casks = [
    "prismlauncher"
  ];
}
