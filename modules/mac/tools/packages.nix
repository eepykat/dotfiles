{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs; [
    git
    hyfetch
    btop
  ];
}