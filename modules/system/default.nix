# modules/system/default.nix
{ ... }: {
  imports = [
    ./packages.nix
  ];


options.programs.steam = lib.mkOption {
  type = lib.types.attrsOf lib.types.anything;
  default = {};
};

}