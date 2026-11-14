# modules/mac/system/default.nix
{ config, lib, inputs, ... }: {
  imports = [
    ./homebrew.nix
    ./home.nix
    ./preferences.nix
    ./omniwm.nix
    ./configs.nix
    inputs.catppuccin.darwinModules.catppuccin
  ];
}