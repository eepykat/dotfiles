{ config, pkgs, lib, ... }:
{
  imports =
    [
      ../../modules/server
    ];

  networking.hostName = "generic-server";
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ ];
}