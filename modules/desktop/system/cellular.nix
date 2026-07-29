# ./modules/desktop/system/cellular.nix

{ inputs, lib, pkgs, config, ... }: {

  options.cellular = {
    enable = lib.mkEnableOption "Cellular";
  };

  config = lib.mkIf config.cellular.enable {
    networking.modemmanager.enable = true; 
    networking.firewall.interfaces."wwan*" = {
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };
}
