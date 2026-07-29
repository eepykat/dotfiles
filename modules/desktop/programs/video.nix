# modules/desktop/system/packages.nix
{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        vlc
        #handbrake
        obs-studio
        losslesscut-bin
    ];
}
