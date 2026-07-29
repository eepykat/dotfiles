# ./modules/desktop/gayming/sniffnet.nix

{ inputs, lib, pkgs, config, ... }: {

  options.sniffnet = {
    enable = lib.mkEnableOption "sniffnet";
  };

  config = lib.mkIf config.sniffnet.enable {
    programs.wireshark.enable = true;
    environment.systemPackages = [
      pkgs.sniffnet
    ];
  };
}