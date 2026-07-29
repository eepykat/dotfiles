# modules/mac/default.nix
{ userConfig, inputs, home, ... }: {
  imports = [
    ./apps
    #./services
    #./system
    #./tools
    inputs.${home}.darwinModules.default
  ];

  users.users.${userConfig.user} = {
    name = userConfig.user;
    home = "/Users/${userConfig.user}";
  };

  nixpkgs.hostPlatform = "aarch64-darwin";

  system = {
    primaryUser = userConfig.user;
    stateVersion = 6;
  };
}
