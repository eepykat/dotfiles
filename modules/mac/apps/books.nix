# modules/mac/apps/books.nix
{ config, lib, pkgs, inputs, ... }:
lib.mkIf config.apps.books.enable {
  homebrew.casks = [
    "calibre"
  ];
}