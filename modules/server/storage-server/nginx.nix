# modules/server/storage-server/nginx.nix
{ pkgs, ... }: {
  services.nginx = {
    enable = true;
    virtualHosts = {
      "store-box.feline.cloud" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:9200";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
          '';
        };
      };
    };
  };

  security.acme = {
    acceptTerms = true;
    defaults.email = "webmaster@feline.cloud";
  };
}