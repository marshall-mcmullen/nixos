{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 22 19999 ];

  networking.networkmanager = {
    enable = true;
  };
}
