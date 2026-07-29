# ./modules/desktop/system/garbage.nix
{ inputs, lib, pkgs, config, ... }: {

  options.system.garbage = {
    enable = lib.mkEnableOption "Garbage";
  };


  config = lib.mkIf config.system.garbage.enable {
    nix.gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };
}
