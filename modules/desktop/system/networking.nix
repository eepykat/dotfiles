# ./modules/desktop/system/networking.nix

{ inputs, lib, pkgs, config, ... }: {

  options.desktop-networking = {
    enable = lib.mkEnableOption "Networking";
  };

  config = lib.mkIf config.desktop-networking.enable {
    networking.networkmanager = {
      enable = true;
      wifi.powersave = false; 
    };
    networking.firewall.enable = true;
    hardware.bluetooth.enable = false; # Bluetooth is bad for you >:C
  };
}
