{ config, pkgs, ... }:

{
  #---- FIREWALL ----#
  networking.firewall.allowedTCPPorts = [ 3000 3001 ];

  #---- RTORRENT ----#
  services.rtorrent = let cfg = config.services.rtorrent; in {
    enable = true;
    port = 50000;
    openFirewall = true;
    configText = ''

      # Open scgi so that nginx can host it.
      execute = chmod,777,(cfg.rpcsock)

      # Watch a directory for new torrents
      schedule = watch_directory, 5, 5, "load.start=${cfg.dataDir}/watch/*.torrent"
 
      # Get full path of data of a torrent (it's a workaround for the possibly empty 'd.base_path' attribute)
      method.insert = d.data_path, simple, "if=(d.is_multi_file), (cat,(d.directory),/), (cat,(d.directory),/,(d.name))"

      # Run custom processing script to unpack the torrent and email on completion
      method.set_key = event.download.finished,notify_me,"execute=/usr/local/bin/rtorrent_process,$d.data_path="

      # Encryption options, set to none (default) or any combination of the following:
      # allow_incoming, try_outgoing, require, require_RC4, enable_retry, prefer_plaintext
      encryption = require,require_RC4,enable_retry
    '';
  };

  #---- NGINX PROXY ----#
  # Setup a proxy for XMLRPC socket
  services.nginx = {
    enable = true;
    group = config.services.rtorrent.group;

    # Set all relevant recommended settings
    recommendedOptimisation = true;
    recommendedProxySettings = true;
    recommendedGzipSettings = true;

    virtualHosts."rtorrent" = {
        default = true;

        listen = [
          {
            addr = "0.0.0.0";
            port = 3000;
          }
        ];

        # Set up the actual proxy
        locations = {
          "/RPC2" = {
            extraConfig = ''
              include ${config.services.nginx.package}/conf/scgi_params;
              scgi_pass unix:${config.services.rtorrent.rpcSocket};
            '';
          };
        };

        # Setup basic auth to protect the access (somewhat)
        #basicAuth = {
        #  rtorrent = secrets.password;
        #};
    };
  };

  #---- FLOOD WEB UI ----#

  systemd.services.flood = {
    enable = true;
    description = "Flood rTorrent Web UI";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.nodePackages.flood}/bin/flood --host 0.0.0.0 --port 3001";
      User = config.services.rtorrent.user;
      Group = config.services.rtorrent.group;
    };

    wantedBy = [ "multi-user.target" ];
  };
}
