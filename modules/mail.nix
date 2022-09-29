{ environment, programs, ... }:

{
  programs.msmtp = {
    enable = true;
    accounts = {
      default = {
        auth = true;
        aliases = "/etc/aliases";
        tls = true;
        from = "autobot.mcmullen@gmail.com";
        host = "smtp.gmail.com";
        port = 587;
        passwordeval = "cat /usr/local/etc/mail/ssmtp-password";
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
