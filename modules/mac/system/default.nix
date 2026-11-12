# modules/mac/system/default.nix
{ config, lib, inputs, ... }: {
  imports = [
    ./homebrew.nix
    ./home.nix
    ./preferences.nix
    ./aerospace.nix
    ./configs.nix
    ./sketchybar.nix
    inputs.catppuccin.darwinModules.catppuccin
  ];
}