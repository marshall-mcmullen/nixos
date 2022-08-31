{ ... }:

{
  services.wordpress.webserver = "nginx";

  services.wordpress.sites."localhost" = {
    extraConfig = ''
      // Needed to run behind reverse proxy
      define('FORCE_SSL_ADMIN', true);
      $_SERVER['HTTPS']='on'
    '';
  };
}
