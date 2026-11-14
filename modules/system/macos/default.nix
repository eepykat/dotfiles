# modules/mac/system/default.nix
{ config, lib, inputs, ... }: {
  imports = [
    ./homebrew.nix
    ./preferences.nix
    ./omniwm.nix
    ./configs.nix
    inputs.catppuccin.darwinModules.catppuccin
  ];
  options = {
    programs.steam = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = {};
    };
    services.flatpak.packages = lib.mkOption {
      type = lib.types.listOf lib.types.anything;
      default = [];
    };
  };
}