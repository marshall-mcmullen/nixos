{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # List of all packages we want to install.
  environment.systemPackages = with pkgs; [
     asunder
     cloudflared
     breeze-grub
     gimp
     google-chrome
     gnome.gnome-control-center
     gnome.gnome-keyring
     grip
     libreoffice
     mailspring
     makemkv
     mate.mate-terminal
     meld
     mkvtoolnix
     nixos-artwork.wallpapers.dracula
     slack
     usbutils
     vlc
     wl-clipboard
     youtube-dl
     zoom-us
  ];
}
