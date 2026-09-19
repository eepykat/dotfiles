{ config, pkgs, lib, ... }:
{
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "gnome" ];
  };

  programs.xwayland.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
  };

  services.gvfs.enable = true;
  services.dbus.packages = [ pkgs.nautilus ];

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  security.pam.services.swaylock = {};
}
