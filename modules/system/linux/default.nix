{...}: {
  imports = [
    ./boot.nix
    ./podman.nix
    ./users.nix
    ./vpn.nix
    ./terminal.nix
  ];
}