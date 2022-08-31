{ ... }:

{
  networking.hostName = "ghostwheel";
  networking.hostId = "cb56bcd9";

  networking.firewall.allowedTCPPorts = [ 22 8080 19999 ];

  # Disable all the resolv.* services as they all try to control /etc/resolv.conf
  # and none of them do it right. We know exactly what contents we want to put in
  # that file so just do it statically here.
  networking.resolvconf.enable = false;
  services.resolved.enable = false;
  networking.networkmanager.dns = "none";

  # Raw contents to put into /etc/resolv.conf
  environment.etc."resolv.conf".text = ''
    domain zentire.com
    search zentire.com
    nameserver 127.0.0.1
    nameserver 1.1.1.1
  '';
}
