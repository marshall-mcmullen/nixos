{ config, pkgs, ... }:

{
  imports = [
    <nixos-hardware/dell/poweredge/r7515>

    # Host specific
    ./hardware-configuration.nix
    ./networking.nix
    ./packages.nix
    ./plex-sync.nix
    ./raid.nix
    ./zfs.nix

    # Netherrack modules
    ./modules/boot-zfs.nix
    ./modules/borgbackup.nix
    ./modules/docker.nix
    ./modules/flexget.nix
    ./modules/gc.nix
    ./modules/irqbalance.nix
    ./modules/localization.nix
    ./modules/mail.nix
    ./modules/netdata.nix
    ./modules/organize-media.nix
    ./modules/packages.nix
    ./modules/plex.nix
    ./modules/resilio.nix
    ./modules/rtorrent.nix
    ./modules/security.nix
    ./modules/sshd.nix
    ./modules/systemd-email.nix
    ./modules/upgrade-check.nix
    ./modules/users.nix
    ./modules/zfs-monitor.nix
  ];

  #===============#
  # DO NOT MODIFY #
  #===============#

  # Optimize Nix storage
  nix.autoOptimiseStore = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix).
  system.copySystemConfiguration = true;

  # Set this to the current release version
  system.stateVersion = "22.05"; # Did you read the comment?
}

