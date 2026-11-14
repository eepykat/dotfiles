# modules/desktop/gayming/mac-gaying.nix
{ config, lib, pkgs, ... }: {
  config = lib.mkIf (pkgs.stdenv.isDarwin && config.gayming.mac-gaying.enable) {
    homebrew = {
      masApps = {
        "Webkinz Next" = 1455137730;
      };
      casks = [
        "pokemon-tcg-live"
        "webkinz"
      ];
    };
  };
}
