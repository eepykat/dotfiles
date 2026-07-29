# modules/mac/apps/utils.nix
{ config, lib, ... }:
lib.mkIf config.apps.utils.enable {
  homebrew.masApps = {
    "Amphetamine" = 937984704;
    "Home Assistant" = 1099568401;
    "Prompt" = 1594420480;
  };

  homebrew.casks = [
    "alfred"
  ];
}
