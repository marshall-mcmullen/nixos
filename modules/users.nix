{ ... }:

{
  users.users.root.initialHashedPassword = "$6$VjGkFYsPIFMAzTTN$dPmHz1bK3XNbxWLRzw5atAgfE/mQKGelY0OZ85HomgXv6kw7KklEQeogPLobB8YpCh7yt0UiIAKEydaK5UObg.";

  users.users.marshall = {
    isNormalUser = true;
    extraGroups = [ 
      "adbusers"
      "audio"
      "cdrom"
      "dialout"
      "disk"
      "docker"
      "input"
      "lp"
      "media"
      "networkmanager"
      "scanner"
      "video"
      "wheel"
    ];
  };

  users.groups.media = {};
}
