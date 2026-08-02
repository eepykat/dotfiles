# modules/mac/apps/games.nix
{ config, lib, ... }:
lib.mkIf config.apps.games.enable {
  homebrew.masApps = {
    "Webkinz Next" = 1455137730;
  };

  homebrew.casks = [
    "prismlauncher"
    #"pokemmo" 
    "pokemon-tcg-live"
    "steam"
    "webkinz"
  ];
}
