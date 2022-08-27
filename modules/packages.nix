{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # List of all packages we want to install.
  environment.systemPackages = with pkgs; [
     ack
     bash-completion
     borgbackup
     docker
     efibootmgr
     exfat
     file
     fwupd
     gcc
     git
     git-filter-repo
     gnumake
     go
     htop
     keychain
     killall
     libsecret
     lsscsi
     mailutils
     most
     neovim
     nix-bash-completions
     nodejs
     pciutils
     rcm
     tmux
     usbutils
     vim
     yarn
     unzip
  ];
}
