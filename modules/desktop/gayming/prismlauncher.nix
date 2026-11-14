# modules/desktop/gayming/prismlauncher.nix
{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.gayming.prismlauncher.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          prismlauncher
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew.casks = [
          "prismlauncher"
        ];
      })
    ]
  );
}
