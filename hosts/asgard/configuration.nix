{ config, pkgs, ... }:

{
  imports = [
    <nixos-hardware/dell/poweredge/r7515>

    # Host specific
    ./hardware-configuration.nix
    ./networking.nix
    ./packages.nix
    ./raid.nix
    ./rtorrent.nix
    ./zfs.nix

    # Zentire modules
    ./modules/boot-zfs.nix
    ./modules/borgbackup.nix
    ./modules/docker.nix
    ./modules/localization.nix
    ./modules/mail.nix
    ./modules/netdata.nix
    ./modules/packages.nix
    ./modules/plex.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/systemd-email.nix
    ./modules/upgrade-check.nix
    ./modules/users.nix
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

