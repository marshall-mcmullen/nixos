{ ... }:

{
  networking.firewall.allowedTCPPorts = [ 8222 ];
  
  services.vaultwarden = {
    enable = true;
    backupDir = "/var/lib/bitwarden_rs/backup";
    config = {
      ROCKET_ADDRESS = "192.168.86.2";
      ROCKET_PORT = 8222;
    };
  };

  systemd.services.vaultwarden.after = [ "network-online.target" ];
  systemd.services.vaultwarden.wants = [ "network-online.target" ];
}
