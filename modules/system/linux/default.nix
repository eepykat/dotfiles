{...}: {
  imports = [
    ./boot.nix
    ./podman.nix
    ./users.nix
    ./vpn.nix
    ./terminal.nix
  ];
  options = {
    homebrew = {
      casks = lib.mkOption {
        type = lib.types.listOf lib.types.anything;
        default = [];
      };
      masApps = lib.mkOption {
        type = lib.types.attrsOf lib.types.int;
        default = {};
      };
    };
  };
}