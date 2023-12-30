{ config, ... }:

{
  # Always install the most up to date version of Vaultwarden from master repo of NixOS
  services.vaultwarden = let
    master = import
        (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/master)
        { config = config.nixpkgs.config; };
  in {
    enable = true;
    package = master.vaultwarden;
    backupDir = "/var/lib/bitwarden_rs/backup";
    config = {
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8222;
    };
  };

  systemd.services.vaultwarden.after = [ "network-online.target" ];
  systemd.services.vaultwarden.wants = [ "network-online.target" ];
}
