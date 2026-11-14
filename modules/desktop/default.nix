# modules/desktop/default.nix
{...}: {
  imports = [
    ./gayming
    ./programs
  ];

  options.services.flatpak.packages = lib.mkOption {
    type = lib.types.listOf lib.types.anything;
    default = [];
  };
}