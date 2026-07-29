# modules/desktop/system/packages.nix
{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        niri
        nautilus
        polkit_gnome
        gnome-keyring
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        kdePackages.polkit-kde-agent-1
    ];
}
