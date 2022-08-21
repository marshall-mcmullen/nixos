{ config, ... }:

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
      "/mnt"
      "/proc"
      "/run"
      "/sys"
      "/tmp"
      "/var/cache"
      "/var/run"
      "/var/tmp"

      # Nix
      "/nix"

      # very large files
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

    extraCreateArgs = ''
      --verbose
      --filter AME
      --list
      --stats
      --exclude-caches
      '';
  };
}
