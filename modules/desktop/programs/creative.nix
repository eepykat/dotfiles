# modules/desktop/programs/creative.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.creative.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          blender
          gimp
        ];
      })

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Acorn" = 6737921844;
            # Affinity not really able to be installed this way anymore
            "Affinity Designer 2" = 1616831348;
            "Affinity Photo 2" = 1616822987;
          };
          casks = [
            "affinity" # New Version ;w;
            "silhouette-studio"
          ];
        };
      })
    ]
  );
}
