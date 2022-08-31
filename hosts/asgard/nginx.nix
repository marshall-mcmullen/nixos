{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 442 443 ];

  systemd.services.nginx.serviceConfig.ReadOnlyPaths = [ "${pkgs.wordpress}" ];

  services.nginx = {
    enable = true;

    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedTlsSettings = true;

    virtualHosts = {
      "bitwarden.zentire.com" = {
        forceSSL = true;
        sslCertificate = "/var/lib/bitwarden_rs/ssl/bitwarden.zentire.com.crt";
        sslCertificateKey = "/var/lib/bitwarden_rs/ssl/bitwarden.zentire.com.key";

        enableACME = false;
        
        locations."/" = {
          proxyPass = "http://192.168.86.2:8222";
          proxyWebsockets = true;
        };
      };

      "pihole.zentire.com" = {
        forceSSL = true;
        sslCertificate = "/var/lib/pihole/ssl/pihole.zentire.com.crt";
        sslCertificateKey = "/var/lib/pihole/ssl/pihole.zentire.com.key";

        enableACME = false;
        
        locations."/" = {
          proxyPass = "http://192.168.86.2:3080";
          proxyWebsockets = true;
        };
      };

      "wordpress.zentire.com" = {
        forceSSL = true;
        sslCertificate = "/var/lib/pihole/ssl/pihole.zentire.com.crt";
        sslCertificateKey = "/var/lib/pihole/ssl/pihole.zentire.com.key";

        enableACME = false;

        locations."/" = {
          root = "${pkgs.wordpress}/share/wordpress";
	  index = "index.php";
        };

	locations."/admin" = {
	  proxyWebsockets = true;

          root = "${pkgs.wordpress}/share/wordpress/wp-admin";
	  index = "index.php";
	};
      };
    };
  };
}
