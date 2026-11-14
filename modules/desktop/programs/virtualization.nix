# modules/desktop/programs/virtualization.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.virtualization.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "CrystalFetch" = 6454431289;
            "UTM" = 1538878817;
          };
          casks = [
          ];
        };
      })
    ]
  );
}
