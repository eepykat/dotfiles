# modules/mac/default.nix
{ userConfig, inputs, ... }: {
  imports = [
    ./apps
    ./system
  ];
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.${userConfig.user} = {
    name = userConfig.user;
    home = "/Users/${userConfig.user}";
  };

  system = {
    primaryUser = userConfig.user;
    stateVersion = 6;
  };
}