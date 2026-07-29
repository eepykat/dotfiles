# modules/mac/apps/terminal.nix
{ config, lib, ... }: 
lib.mkIf config.apps.terminal.enable {
  homebrew.casks = [
    #"kitty"
  ];
}