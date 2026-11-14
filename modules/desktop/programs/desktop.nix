# modules/desktop/system/desktop.nix
{ config, lib, pkgs, ... }: {
  config = lib.mkIf pkgs.stdenv.isLinux {
    environment.systemPackages = with pkgs; [
      gnome-keyring
      kdePackages.polkit-kde-agent-1
      nautilus
      polkit_gnome
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
}