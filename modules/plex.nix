{ ... }:

{
  services.plex = {
    enable = true;
    openFirewall = true;
  };


  # Need to add plex user to media group so that the media unpacked by torrent can be read by plex
  users.users.plex.extraGroups = [ "media" ];
} 
