# modules/mac/tools/default.nix
{ config, lib, inputs, ... }: {
  imports = [
    ./hyfetch.nix
  ];
}