# modules/desktop/programs/music.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.music.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          #supersonic-wayland
          spotify
        ];
      })

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
          };
          casks = [
            "spotify"
          ];
        };
      })
    ]
  );
}
