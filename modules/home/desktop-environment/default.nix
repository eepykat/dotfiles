# modules/home/desktop-environment/default.nix
{ ... }: {
  imports = [
    ./cursor.nix
    ./noctalia.nix
    ./omniwm.nix
    ./umbriel.nix
  ];
}