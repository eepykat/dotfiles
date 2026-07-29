# ./modules/desktop/gayming/roblox.nix

{ inputs, lib, pkgs, config, ... }: {

  options.roblox = {
    enable = lib.mkEnableOption "Roblox";
  };

  config = lib.mkIf config.roblox.enable {
    services.flatpak.packages = ["org.vinegarhq.Sober"];
  };
}