# ./modules/desktop/gayming/pokemmo.nix

{ inputs, lib, pkgs, config, ... }: {

  options.pokemmo = {
    enable = lib.mkEnableOption "PokeMMO";
  };

  config = lib.mkIf config.pokemmo.enable {
    environment.systemPackages = [pkgs.stable.pokemmo-installer];
  };
}
