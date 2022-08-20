{ pkgs, ... }:

{
  networking.hostName = "caprica";
  networking.firewall.allowedTCPPorts = [ 22 ];

  # Configure NetworkManager
  networking.networkmanager = {
    enable = true;

    # Create a dispatcher script to disable WiFi when we have a physical ethernet connection
    # and re-enable WiFi when we lose our physical ethernet connection.
    dispatcherScripts = [ {
      source = pkgs.writeText "wifi-wired-exclusive.sh" ''
          #!/usr/bin/env bash
          export LC_ALL=C
          
          enable_disable_wifi ()
          {
              result=$(nmcli dev | grep "ethernet" | grep -w "connected")
              if [ -n "$result" ]; then
                  logger "ETH connected, disabling WIFI"
                  nmcli radio wifi off
              else
                  logger "ETH disconnected, enabling WIFI"
                  nmcli radio wifi on
              fi
          }
          
          if [[ "$2" = @(up|down) ]]; then
              enable_disable_wifi
          fi
      '';
      type = "basic";
      }
    ];
  };
}
