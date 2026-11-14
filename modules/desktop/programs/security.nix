# modules/desktop/programs/security.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.security.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        programs.wireshark.enable = true;
        environment.systemPackages = with pkgs; [
          sniffnet
          bitwarden-desktop
          proton-pass
        ];
      })

      (lib.optionalAttrs pkgs.stdenv.isDarwin {
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