# modules/desktop/programs/vpn.nix
{ config, lib, pkgs, inputs, ... }: {
  config = lib.mkIf config.desktop.programs.vpn.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        environment.systemPackages = with pkgs; [
        ];
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew = {
          masApps = {
            "WireGuard" = 1451685025;
          };
          casks = [
            "protonvpn"
          ];
        };
      })
    ]
  );
}
