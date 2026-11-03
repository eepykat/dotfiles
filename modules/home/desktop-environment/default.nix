# /modules/home/desktop-environment/default.nix
{ ... }: {
  imports = [
    ./noctalia.nix
    ./umbriel.nix
    ./cursor.nix
  ];
}