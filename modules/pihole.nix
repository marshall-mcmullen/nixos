{ config, pkgs, lib, ... }:
{
  networking.firewall.allowedTCPPorts = [ 53 3080 30443 ];
  networking.firewall.allowedUDPPorts = [ 53 ];

  virtualisation.oci-containers.containers.pihole = {
    image = "pihole/pihole:latest";
    ports = [
      "53:53/tcp"
      "53:53/udp"
      "3080:80"
      "30443:443"
    ];
    volumes = [
      "/var/lib/pihole/pihole/:/etc/pihole/"
      "/var/lib/pihole/dnsmasq.d:/etc/dnsmasq.d/"
      "/var/lib/pihole/www/external.conf:/etc/lighttpd/external.conf"
      "/var/lib/pihole/pihole/custom.list:/etc/hosts"
    ];

    #environment = {
    #  FTLCONF_REPLY_ADDR4 = "192.168.86.2";
    #  IPv6 = "false";
    #  PIHOLE_DNS_1 = "1.1.1.3";
    #  ServerIP = "192.168.86.2";
    #  TZ = "America/Denver";
    #  VIRTUAL_HOST = "192.168.86.2";
    #  WEBPASSWORD="vruGT5530J0I!N%P%Ao!";
    #};

    extraOptions = [
      "--cap-add=NET_ADMIN"
    ];

  };
}
