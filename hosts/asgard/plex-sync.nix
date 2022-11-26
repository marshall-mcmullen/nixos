{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [ openssh rrsync rsync ];

  systemd.services.plex-sync = {
    description = "Sync Plex media from primary server to backup server";
    path = with pkgs; [ openssh rrsync rsync ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.rsync}/bin/rsync -avzh --delete --no-perms --omit-dir-times -e 'ssh -i /root/.ssh/plex-media-sync' /media/ root@ghostwheel:";
    };
  };

  systemd.timers.plex-sync = {
    wantedBy = [ "timers.target" ];
    partOf = [ "plex-sync.service" ];
    timerConfig = {
      OnCalendar = "daily";
      Unit = "plex-sync.service";
    };
  };
}
