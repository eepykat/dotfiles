# modules/mac/default.nix
{ userConfig, inputs, ... }: {
  imports = [
    ./apps
    #./services
    ./system
    ./tools
  ];
  nixpkgs.hostPlatform = "aarch64-darwin";
}