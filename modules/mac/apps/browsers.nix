# modules/mac/apps/browsers.nix
{ config, lib, pkgs, inputs, ... }:
lib.mkIf config.apps.browsers.enable {
  homebrew.masApps = {
    "Wipr" = 1662217862;
    "Shut Up" = 1015043880;
  };
  homebrew.casks = [
    "firefox"
    "ungoogled-chromium"
    "zen"
  ];
}

