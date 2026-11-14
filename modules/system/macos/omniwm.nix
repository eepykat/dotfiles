# modules/system/macos/omniwm.nix
{ config, lib, pkgs, ... }: {
  options.mac.omniwm.enable = lib.mkEnableOption "OmniWM system package & JankyBorders";

  config = lib.mkIf config.mac.omniwm.enable {
    environment.systemPackages = [
      pkgs.omniwm
    ];

    services.jankyborders = {
      enable = true;
      active_color = "0xffcba6f7";
      inactive_color = "0xff313244";
      width = 4.0;
      style = "round";
      hidpi = true;
    };
  };
}
