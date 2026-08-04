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

  # Enable packet forwarding
  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
  };

  # Set a static IP on the Ethernet interface (the downstream device connects to this IP)
  networking.interfaces."enp0s31f6" = {
    useDHCP = false;
    ipv4.addresses = [{ address = "10.0.0.1"; prefixLength = 24; }];
  };

  # Set up NAT / IP Masquerading
  networking.nat = {
    enable = true;
    internalInterfaces = [ "enp0s31f6" ]; # Ethernet port
    externalInterface = "wwp0s20f0u6";          # Cellular connection
  };

  # Allow the downstream client to communicate through the firewall
  networking.firewall.allowedUDPPorts = [ 53 67 ]; # DNS and DHCP


  };
}
