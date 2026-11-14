# modules/mac/system/default.nix
{ config, lib, inputs, ... }: {
  imports = [
    ./homebrew.nix
    ./home.nix
    ./preferences.nix
    ./omniwm.nix
    ./configs.nix
    ./kitty.nix
    ./terminal.nix
    inputs.catppuccin.darwinModules.catppuccin
  ];
}