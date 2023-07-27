{ config, pkgs, lib, ... }:
{
  networking.firewall.allowedTCPPorts = [ 53 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.containers.pihole = {
    image = "pihole/pihole:latest";
    ports = [
      "53:53/tcp"
      "53:53/udp"
      "3080:3080"
    ];
    volumes = [
      "/var/lib/pihole/pihole/:/etc/pihole/"
      "/var/lib/pihole/dnsmasq.d:/etc/dnsmasq.d/"
      "/var/lib/pihole/www/external.conf:/etc/lighttpd/external.conf"
      "/var/lib/pihole/pihole/custom.list:/etc/hosts"
    ];

    extraOptions = [
      "--cap-add=NET_ADMIN"
      "--network=host"
    ];

  };
}
