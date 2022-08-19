{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
 
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

  environment.systemPackages = with pkgs; [
     ack
     bash-completion
     borgbackup
     compton
     docker
     exfat
     file
     fwupd
     gcc
     gimp
     git
     gnumake
     go
     google-chrome
     htop
     keychain
     killall
     libreoffice
     makemkv
     mate.mate-terminal
     meld
     mkvtoolnix
     most
     neovim
     nix-bash-completions
     nixos-artwork.wallpapers.dracula
     pciutils
     rcm
     tmux
     usbutils
     vim
     vimPlugins.vim-nix
     vlc
     xorg.xkill
     xscreensaver
     youtube-dl
  ];
}
