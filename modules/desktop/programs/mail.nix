# modules/desktop/programs/mail.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.mail.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Canary Mail" = 1236045954;
          };
          casks = [
            "proton-mail"
          ];
        };
      })
    ]
  );
}
