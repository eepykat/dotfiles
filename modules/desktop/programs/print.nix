# modules/desktop/programs/print.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.print.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew.casks = [
          "blender"
          "orcaslicer"
          "prusaslicer"
        ];
      })
    ]
  );
}
