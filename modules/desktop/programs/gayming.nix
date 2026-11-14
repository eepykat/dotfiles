# modules/desktop/programs/gayming.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.gayming.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          blockbench
          prismlauncher
        ];
      })

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Webkinz Next" = 1455137730;
          };
          casks = [
            #"pokemmo"
            "pokemon-tcg-live"
            "prismlauncher"
            "steam"
            "webkinz"
          ];
        };
      })
    ]
  );
}