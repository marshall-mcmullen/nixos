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
     ack
     bash-completion
     borgbackup
     breeze-grub
     docker
     exfat
     file
     fwupd
     gcc
     gimp
     git
     git-filter-repo
     gnumake
     go
     google-chrome
     gnome.gnome-keyring
     htop
     keychain
     killall
     libreoffice
     libsecret
     mailspring
     mailutils
     makemkv
     mate.mate-terminal
     meld
     mkvtoolnix
     most
     neovim
     nix-bash-completions
     nixos-artwork.wallpapers.dracula
     nodejs
     pciutils
     rcm
     slack
     tmux
     usbutils
     vim
     vlc
     xscreensaver
     yarn
     youtube-dl
  ];
}
