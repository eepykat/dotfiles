# modules/desktop/gayming/hydra-launcher.nix
{ inputs, lib, pkgs, config, ... }: {
  config = lib.mkIf (pkgs.stdenv.isLinux && config.gayming.hydra-launcher.enable) {
    environment.systemPackages = [ pkgs.stable.hydralauncher ];
  };
}
