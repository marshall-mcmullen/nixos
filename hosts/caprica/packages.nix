{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # Customize the command line args used to start chrome for proper hardware acceleration. 
  nixpkgs.config.packageOverrides = pkgs: {
    google-chrome = pkgs.google-chrome.override {
	commandLineArgs = [ 
		"--disable-reading-from-canvas"
    		"--disable-sync-preference"
    		"--enable-drdc"
    		"--enable-features=WebUIDarkMode,VaapiVideoEncoder,VaapiVideoDecoder,CanvasOopRasterization"
    		"--enable-gpu-rasterization"
    		"--enable-oop-rasterization"
    		"--enable-raw-draw"
    		"--enable-unsafe-webgpu"
    		"--enable-zero-copy"
    		"--force-dark-mode"
    		"--ignore-gpu-blocklist"
    		"--use-gl=egl"
    		"--use-vulkan"
	];
    };
  };

  # List of all packages we want to install.
  environment.systemPackages = with pkgs; [
     asunder
     cloudflared
     breeze-grub
     gimp
     google-chrome
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
     xscreensaver
     youtube-dl
     zoom-us
  ];
}
