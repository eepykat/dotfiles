# modules/desktop/linux/default.nix
{...}: {
  imports = [
    ./desktop-environment
    ./system
  ];
}