{ environment, programs, ... }:

{
  programs.msmtp = {
    enable = true;
    accounts = {
      default = {
        aliases = "/etc/aliases";
        auth = true;
        from = "autobot.mcmullen@gmail.com";
        host = "smtp.gmail.com";
        passwordeval = "cat /usr/local/etc/mail/ssmtp-password";
        port = 587;
        tls = true;
        user = "autobot.mcmullen@gmail.com";
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
