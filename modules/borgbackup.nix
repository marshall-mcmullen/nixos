{ config, pkgs, ... }:

{
  services.borgbackup.jobs."system" = {
    doInit = true;
    repo = "ssh://borg-backup@lazarus/volume1/BorgBackup/${config.networking.hostName}";
    encryption.mode = "none";
    environment.BORG_RSH = "ssh -i /usr/local/etc/ssh/borg -o BatchMode=yes -o VerifyHostKeyDNS=yes";
    compression = "auto,lz4";
    startAt = "daily";
 
    paths = [
      "/"
    ];

    exclude = [
      # Linux System Files
      "/dev"
      "/lost+found"
      "/mnt"
      "/nix"
      "/proc"
      "/run"
      "/sys"
      "/tmp"
      "/var/cache"
      "/var/run"
      "/var/tmp"

      # Exclude torrents
      "/var/lib/rtorrent"

      # very large files
      "/var/lib/containers"
      "/var/lib/docker"
      "/var/lib/kubelet"
      "/var/lib/systemd"
      "/var/lib/libvirt"
   
      # Temporary and cache files
      "**/.cache"
      "**/Cache"
      "/home/**/go/bin"
      "/home/**/go/pkg"
    ];
  
    prune.keep = {
      daily = 7;
      weekly = 4;
      monthly = 6;
    }; 

    extraArgs = ''
      --remote-path=/usr/local/bin/borg
      '';

    extraCreateArgs = ''
      --verbose
      --filter AME
      --list
      --stats
      --exclude-caches
      '';

    preHook = ''
  
      borg(){
        "$(${pkgs.which}/bin/which borg)" "$@" && rc=0 || rc=$?

        if [[ $rc -eq 1 ]]; then
          return 0
        else
          return $rc
        fi
      }
    '';
  };
}
