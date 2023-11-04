{ config, ... }:

{
  # Always install the most up to date version of Plex from master repo of NixOS
  services.plex = let
    master = import
        (builtins.fetchTarball https://github.com/nixos/nixpkgs/tarball/master)
        { config = config.nixpkgs.config; };
  in {
    enable = true;
    openFirewall = true;
    package = master.plex;
  };

  # Need to add plex user to media group so that the media unpacked by torrent can be read by plex
  users.users.plex.extraGroups = [ "media" ];
} 
