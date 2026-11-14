# modules/home/desktop-environment/omniwm.nix
{ config, lib, pkgs, ... }: {
  options.omniwm = {
    enable = lib.mkEnableOption "OmniWM user configuration";
  };

  config = lib.mkIf (pkgs.stdenv.hostPlatform.isDarwin && config.desktop.enable && config.omniwm.enable) {
    programs.omniwm = {
      enable = true;
      launchd.enable = true;
    };
  };
}
