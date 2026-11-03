# modules/home/desktop-environment/cursor.nix
{ config, inputs, lib, pkgs, ... }: {
  home.pointerCursor = {
    name = "Nordic-cursors";
      package = pkgs.nordic-cursors;
      size = 24;
      gtk.enable = true;
      x11.enable = true;
  };
  home.sessionVariables = {
    XCURSOR_THEME = config.home.pointerCursor.name;
    XCURSOR_SIZE = toString config.home.pointerCursor.size;
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      cursor-theme = "Nordic-cursors";
      cursor-size = 24;
    };
  };
}