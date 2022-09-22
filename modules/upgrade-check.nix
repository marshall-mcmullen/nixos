{ pkgs, ... }:

{
  systemd.services.upgrade-check = {
    serviceConfig.Type = "oneshot";
    path = with pkgs; [ bash nix nixos-rebuild ];
    environment = { 
    	NIX_PATH = "nixpkgs=/nix/var/nix/profiles/per-user/root/channels/nixos:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels";
    };
    script = ''
      /usr/local/bin/nixos-upgrade-check
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
