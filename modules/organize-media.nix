{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     exiftool
     fdupes
  ];

  systemd.services.organize-media = {
    serviceConfig.Type = "oneshot";
    path = with pkgs; [ bash exiftool fdupes ];
    script = ''
      bash /usr/local/bin/organize-media;
    '';
  };

  systemd.timers.organize-media = {
    wantedBy = [ "timers.target" ];
    partOf = [ "organize-media.service" ];
    timerConfig = {
      OnCalendar = "hourly";
      Unit = "organize-media.service";
    };
  };
}
