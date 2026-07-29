{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        obsidian
        libreoffice
    ];
}
