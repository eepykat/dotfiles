# modules/system/default.nix
{ ... }: {
  imports = [
    ./packages.nix
    ./git.nix
    ./gpg.nix
  ];
}