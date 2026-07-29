# modules/mac/apps/terminal.nix
{ config, lib, ... }: 
lib.mkIf config.apps.terminal.enable {

  environment.systemPackages = [
    pkgs.starship
  ];

  homebrew.casks = [
    #"kitty"
  ];
}