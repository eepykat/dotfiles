# modules/mac/default.nix
{ userConfig, inputs, ... }: {
  imports = [
    ./apps
    #./services
    ./system
    #./tools
  ];

  users.users.${userConfig.user} = {
    name = userConfig.user;
    home = "/Users/catbook";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    primaryUser = userConfig.user;
    stateVersion = 6;
  };
}
