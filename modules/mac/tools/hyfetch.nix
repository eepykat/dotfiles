{ config, pkgs, lib, ... }: {
  environment.systemPackages = [
    pkgs.hyfetch
  ];
}