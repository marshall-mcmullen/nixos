{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # List of all packages we want to install.
  environment.systemPackages = with pkgs; [
     asunder
     cloudflared
     brasero
     breeze-grub
     cdrtools
     envsubst
     fd
     ffmpeg
     fzf
     gimp
     gnome.gnome-control-center
     gnome.gnome-keyring
     google-chrome
     google-cloud-sdk
     grip
     libreoffice
     makemkv
     mate.mate-terminal
     meld
     mkvtoolnix
     nixos-artwork.wallpapers.dracula
     patchelf
     picom
     slack
     thunderbird-unwrapped
     usbutils
     vlc
     wl-clipboard
     yt-dlp
     zoom-us
  ];
}
