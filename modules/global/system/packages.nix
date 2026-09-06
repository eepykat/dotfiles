{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wget
    curl
    btop
    usbutils
    pciutils
    rsync
    git
    ansible
    just
    pwgen
    python3
    zip
    unzip
    sl
  ];
}