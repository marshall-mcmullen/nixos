{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  # List of all packages we want to install.
  environment.systemPackages = with pkgs; [
     ack
     ansi2html
     bash-completion
     bind
     borgbackup
     colordiff
     efibootmgr
     exfat
     file
     fwupd
     gcc
     gcr
     git
     git-filter-repo
     gnumake
     go
     htop
     jq
     keychain
     killall
     libsecret
     lsscsi
     mailutils
     most
     netdata
     neovim
     nix-bash-completions
     nix-output-monitor
     nodejs
     pciutils
     rcm
     tmux
     tree
     usbutils
     yarn
     unzip
  ];

  programs.bash.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };
}
