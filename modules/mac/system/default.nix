# modules/mac/system/default.nix
{
  config,
  lib,
  ...
}: {
  imports = [
    ./homebrew.nix
    ./home.nix
    ./preferences.nix
    inputs.catppuccin.darwinModules.catppuccin
  ];

}