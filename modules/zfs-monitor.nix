{ pkgs, ... }:

{
  services.zfs.trim.enable = true;
  services.zfs.autoScrub.enable = true;

  ## Check ZFS Status ##
  systemd.services.zfs-status = {
    serviceConfig.Type = "oneshot";
    path = with pkgs; [ bash ];
    script = ''
      if ${pkgs.zfs}/bin/zpool status | egrep -i '(DEGRADED|FAULTED|OFFLINE|UNAVAIL|REMOVED|FAIL|DESTROYED|corrupt|cannot|unrecover)'; then
        echo "ZFS STATUS FAILURE"
	exit 1
      fi
    '';
  };
  systemd.timers.zfs-status = {
    wantedBy = [ "timers.target" ];
    partOf = [ "zfs-status.service" ];
    timerConfig = {
      OnCalendar = "daily";
      Unit = "zfs-status.service";
    };
  };
}
