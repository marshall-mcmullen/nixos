{ ... }:

{
  services.wordpress.webserver = "nginx";

  services.wordpress.sites."web" = {
    database.createLocally = true;  # name is set to `wordpress` by default
    themes = [ ];
    plugins = [ ];
    virtualHost = {
      adminAddr = "marshall.mcmullen@gmail.com";
      serverAliases = [ ];
    };
  };
}
