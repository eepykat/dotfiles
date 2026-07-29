{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        bitwarden-desktop
        proton-pass
    ];
}
