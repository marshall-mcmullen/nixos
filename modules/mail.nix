{ environment, programs, ... }:

{
  programs.msmtp = {
    enable = true;
    accounts = {
      default = {
        auth = true;
        aliases = "/etc/aliases";
        tls = true;
        from = "marshall.mcmullen@gmail.com";
        host = "smtp.gmail.com";
        port = 587;
        passwordeval = "cat /usr/local/etc/mail/ssmtp-password";
        user = "marshall.mcmullen@gmail.com";
      };
    };
  };

  environment.etc = {
    "aliases" = {
      text = ''
        root: marshall.mcmullen@gmail.com
        default: marshall.mcmullen@gmail.com
      '';
      mode = "0644";
    };
  };
}
