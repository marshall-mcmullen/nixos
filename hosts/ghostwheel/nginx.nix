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
          proxyPass = "http://192.168.86.2:8222";
          proxyWebsockets = true;
        };
      };

      "pihole.netherrack.net" = {
        forceSSL = true;
        enableACME = false;
        sslCertificate = "/var/lib/acme/netherrack.net/cert.pem";
        sslCertificateKey = "/var/lib/acme/netherrack.net/key.pem";
        locations."/" = {
          proxyPass = "http://192.168.86.2:3080";
          proxyWebsockets = true;
        };
      };
    };
  };
}
