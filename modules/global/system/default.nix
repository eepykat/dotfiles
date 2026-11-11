{...}: {
  imports = [
    ./boot.nix
    ./packages.nix
    ./podman.nix
    ./users.nix
    ./vpn.nix
    ./terminal.nix
    ./garbage.nix
  ];
}