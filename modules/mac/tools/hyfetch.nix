{ config, pkgs, lib, ... }: {
  environment.systemPackages = with pkgs.stable; [
    hyfetch
  ];
}