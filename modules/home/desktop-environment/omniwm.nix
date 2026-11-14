# modules/home/desktop-environment/omniwm.nix
{ config, lib, pkgs, ... }: {
  options.omniwm = {
    enable = lib.mkEnableOption "OmniWM window manager";
  };

  config = lib.mkIf (pkgs.stdenv.isDarwin && config.desktop.enable && config.omniwm.enable) {
    programs.omniwm = {
      enable = true;
      launchd.enable = true;
    };
  };
}
