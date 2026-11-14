# modules/mac/system/omniwm.nix
{ pkgs, ... }: {
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
}