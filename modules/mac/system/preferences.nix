# modules/mac/system/preferences.nix
{ pkgs, userConfig, ... }: {
  catppuccin = {
    enable = true;
    flavor = "mocha";
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
    '';
  };

  users.users.${userConfig.user} = {
    shell = pkgs.fish;
  };



}