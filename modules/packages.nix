{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  # List of all packages we want to install.
  environment.systemPackages = with pkgs; [
     ack
     bash-completion
     borgbackup
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
     netdata
     neovim
     nix-bash-completions
     nodejs
     pciutils
     rcm
     tmux
     usbutils
     yarn
     unzip
  ];

  programs.bash.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
