# /modules/home/desktop-environment/default.nix
{ ... }: {
  imports = [
    ./niri.nix
    ./noctalia.nix
  ];
}
