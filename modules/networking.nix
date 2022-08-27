{ pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 22 ];
 
  networking.networkmanager = {
    enable = true;
  };
}
