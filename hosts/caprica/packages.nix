{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
	"mailspring-1.12.0"
  ];

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
     mailspring
     makemkv
     mate.mate-terminal
     meld
     mkvtoolnix
     nixos-artwork.wallpapers.dracula
     patchelf
     slack
     usbutils
     vlc
     wl-clipboard
     youtube-dl
     yt-dlp
     zoom-us
  ];
}
