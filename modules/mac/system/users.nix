# modules/mac/system/users.nix
{ pkgs, userConfig, ... }: {
  users.users.${userConfig.user} = {
    name = userConfig.user;
    home = "/Users/${userConfig.user}";
  };

  

  system = {
    primaryUser = userConfig.user;
    stateVersion = 6;
  };
}