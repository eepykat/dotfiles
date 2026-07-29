# ./modules/desktop/gayming/hydra-launcher.nix

{ inputs, lib, pkgs, config, ... }: {

  options.hydra-launcher = {
    enable = lib.mkEnableOption "hydra-launcher";
  };

  config = lib.mkIf config.hydra-launcher.enable {
    environment.systemPackages = [pkgs.stable.hydralauncher];
  };
}
