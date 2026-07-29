# modules/mac/system/default.nix
{
  config,
  lib,
  ...
}: {
  imports = [
    ./homebrew.nix
  ];
}