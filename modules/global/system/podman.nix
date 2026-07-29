# ./modules/global/system/podman.nix

{ inputs, lib, pkgs, config, ... }: {

  options.podman = {
    enable = lib.mkEnableOption "Podman";
  };

  config = lib.mkIf config.podman.enable {
    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
      };
    };
  };
}