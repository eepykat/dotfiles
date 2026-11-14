# modules/desktop/default.nix
{ lib, ... }: {
  imports = [
    ./gayming
    ./programs
  ];

  options.services.flatpak.packages = lib.mkOption {
    type = lib.types.listOf lib.types.anything;
    default = [];
  };
}