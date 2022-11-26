{ config, pkgs, lib, ... }:

{
  environment.systemPackages = [ pkgs.cloudflared ];

  systemd.services.cloudflared = {
    enable = true;
    description = "CloudFlare Tunnel daemon (and DNS-over-HTTPS client)";
    path = with pkgs; [ cloudflared ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.cloudflared}/bin/cloudflared tunnel --config /usr/local/etc/cloudflared/config.yml --no-autoupdate run netherrack";
    };

    wantedBy = [ "multi-user.target" ];
  };
}
