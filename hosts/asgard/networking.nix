{ ... }:

{
  networking.hostName = "asgard";
  networking.hostId = "fd074411";

  # 22    : ssh
  # 19999 : ??
  # 25565 : minecraft server
  # 32400 : Plex server
  networking.firewall.allowedTCPPorts = [ 22 19999 25565 32400 ];
}
