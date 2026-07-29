# ./modules/desktop/gayming/steam.nix

{ inputs, lib, pkgs, config, ... }: {

  options.steam = {
    enable = lib.mkEnableOption "Steam";
  };

  config = lib.mkIf config.steam.enable {

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
  };
}
