# modules/desktop/programs/audio.nix
{ config, lib, pkgs, ... }: {
  config = lib.mkIf config.desktop.programs.audio.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [



        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Logic Pro" = 634148309;
          };
          casks = [
            "fission"
            "mediahuman-audio-converter"
            "musicbrainz-picard"
          ];
        };
      })
    ]
  );
}
