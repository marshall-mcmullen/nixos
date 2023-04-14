{ pkgs, ... }:

{
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "marshall.mcmullen@gmail.com";

  # /var/lib/acme must be writable by the ACME user and readable by the Nginx user.
  # The easiest way to achieve this is to add the Nginx user to the ACME group.
  users.users.nginx.extraGroups = [ "acme" ];

  security.acme.certs."netherrack.net" = {
    domain = "*.netherrack.net";
    dnsProvider = "cloudflare";
    credentialsFile = "/usr/local/etc/cloudflared/certs.secret";
    dnsPropagationCheck = true;
    postRun = "systemctl restart nginx";
  };
}
