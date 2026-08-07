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
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
  };
  networking.interfaces."enp0s31f6" = {
    useDHCP = false;
    ipv4.addresses = [{ address = "10.0.0.1"; prefixLength = 24; }];
  };
  networking.nat = {
    enable = true;
    internalInterfaces = [ "enp0s31f6" ]; # Ethernet port
    externalInterface = "wwp0s20f0u6";          # Cellular connection
  };
  networking.firewall.allowedUDPPorts = [ 53 67 ]; # DNS and DHCP
  };
}
