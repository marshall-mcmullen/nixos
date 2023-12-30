{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 443 ];

  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      "bitwarden.netherrack.net" = {
        forceSSL = true;
        enableACME = false;
        sslCertificate = "/var/lib/acme/netherrack.net/cert.pem";
        sslCertificateKey = "/var/lib/acme/netherrack.net/key.pem";
        locations."/" = {
          proxyPass = "http://127.0.0.1:8222";
          proxyWebsockets = true;
        };
      };

      "torrent.netherrack.net" = {
        forceSSL = true;
        enableACME = false;
        sslCertificate = "/var/lib/acme/netherrack.net/cert.pem";
        sslCertificateKey = "/var/lib/acme/netherrack.net/key.pem";
        locations."/" = {
          proxyPass = "http://127.0.0.1:3001";
          proxyWebsockets = true;
        };
      };
 
      "backup.netherrack.net" = {
        forceSSL = true;
        enableACME = false;
        sslCertificate = "/var/lib/acme/netherrack.net/cert.pem";
        sslCertificateKey = "/var/lib/acme/netherrack.net/key.pem";
        locations."/" = {
          proxyPass = "http://lazarus:5000";
          proxyWebsockets = true;
        };
      };
    };
  };
}
