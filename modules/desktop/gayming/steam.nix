# modules/desktop/gayming/steam.nix
{ inputs, lib, pkgs, config, ... }: {
  config = lib.mkIf config.gayming.steam.enable (
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isLinux {
        programs.steam = {
          enable = true;
          package = pkgs.millennium-steam;

          remotePlay.openFirewall = false;
          dedicatedServer.openFirewall = false;
          localNetworkGameTransfers.openFirewall = false;

          extraCompatPackages = with pkgs; [
            proton-ge-bin
          ];
        };
      })

      (lib.mkIf pkgs.stdenv.isDarwin {
        homebrew.casks = [
          "steam"
        ];
      })
    ]
  );
}
