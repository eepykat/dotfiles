# modules/home/desktop-environment/cursor.nix
{ config, inputs, lib, pkgs, ... }: {
  imports = [
    inputs.cursor.homeModules.default
  ];

  options.programs.custom-cursor = {
    enable = lib.mkEnableOption "cursor";
  };

  config = lib.mkIf (config.desktop.enable && config.programs.custom-cursor.enable) {
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
  };
}