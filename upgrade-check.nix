{ pkgs, ... }:

{
  systemd.services.upgrade-check = {
    serviceConfig.Type = "oneshot";
    path = with pkgs; [ bash ];
    script = ''
      bash /usr/local/bin/nixos-upgrade-check
    '';
  };

  systemd.timers.upgrade-check = {
    wantedBy = [ "timers.target" ];
    partOf = [ "upgrade-check.service" ];
    timerConfig = {
      OnCalendar = "daily";
      Unit = "upgrade-check.service";
    };
  };
}
