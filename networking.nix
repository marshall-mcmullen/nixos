{ ... }:

{
  networking.hostName = "caprica";
  networking.networkmanager.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
}
