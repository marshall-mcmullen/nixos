{ pkgs, ... }:

{
  services.netdata.enable = true;
  
  services.netdata.configDir = {
    "health_alarm_notify.conf" = pkgs.writeText "health_alarm_notify.conf" ''
      send_email="YES"
      email_sender="netdata <root@$HOSTNAME>"
      default_recipient_email="marshall.mcmullen@gmail.com"
      sendmail="/run/wrappers/bin/sendmail"
    '';
  };
}
