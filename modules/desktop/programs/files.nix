# modules/desktop/programs/files.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.files.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          localsend
          seafile-client
        ];
      })

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "FileBot" = 905384638;
            "Keka" = 470158793;
          };
          casks = [
            "localsend"
            "proton-drive"
            "seafile-client"
          ];
        };
      })
    ]
  );
}
