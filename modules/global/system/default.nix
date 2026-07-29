{...}: {
  imports = [
    ./boot.nix
    ./packages.nix
    ./podman.nix
    ./users.nix
    ./vpn.nix
  ];
}