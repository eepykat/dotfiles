# modules/server/storage-server/opencloud.nix
{ pkgs, ... }:  

{
  environment.etc."opencloud-admin-pass".text = ''
    IDM_ADMIN_PASSWORD=secure-password
  '';

  services.opencloud = {
    enable = true;
    url = "https://cloud.your.domain";
    address = "127.0.0.1";
    port = 9200;
    environment = {
      PROXY_TLS = "false";
    };
    environmentFile = "/etc/opencloud-admin-pass";
  };
}