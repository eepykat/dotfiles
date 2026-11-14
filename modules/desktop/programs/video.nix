# modules/desktop/programs/video.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.video.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          #handbrake
          losslesscut-bin
          obs-studio
          vlc
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Captionator" = 1627843786;
            "Claquette" = 587748131;
            "Compressor" = 424390742;
            "DaVinci Resolve" = 571213070;
            "Final Cut Pro" = 424389933;
            "LosslessCut" = 1505323402;
            "Motion" = 434290957;
          };
          casks = [
            "handbrake-app"
            "obs"
          ];
        };
      })
    ]
  );
}
