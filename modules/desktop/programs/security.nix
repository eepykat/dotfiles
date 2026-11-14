# modules/desktop/programs/security.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.security.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
          bitwarden-desktop
          proton-pass
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "Bitwarden" = 1352778147;
            "Yubico Authenticator" = 1497506650;
          };
          casks = [
            "proton-pass"
          ];
        };
      })
    ]
  );
}