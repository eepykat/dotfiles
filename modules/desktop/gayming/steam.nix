# modules/desktop/gayming/steam.nix
{ inputs, lib, pkgs, config, ... }: {
  config = lib.mkIf config.gayming.steam.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        programs.steam = {
          enable = true;

          remotePlay.openFirewall = false;
          dedicatedServer.openFirewall = false;
          localNetworkGameTransfers.openFirewall = false;

          extraCompatPackages = lib.optionals pkgs.stdenv.hostPlatform.isLinux (
            with pkgs; [
              proton-ge-bin
            ]
          );
        } // lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux {
          package = pkgs.millennium-steam;
        };
      })

      (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
        homebrew.casks = [
          "steam"
        ];
      })
    ]
  );
}
