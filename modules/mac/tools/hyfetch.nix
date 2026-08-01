{ config, pkgs, lib, ... }: {
  environment.systemPackages = [
    hyfetch
  ];
}