# modules/server/storage-server/immich.nix
{ config, pkgs, ... }: {
  services.immich = {
    enable = true;
    port = 2283;
    host = "127.0.0.1";
    mediaLocation = "/var/lib/immich";
  };
  users.users.immich.extraGroups = [ "video" "render" ];
}