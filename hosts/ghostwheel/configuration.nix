{ config, pkgs, ... }:

{
  imports = [
    <nixos-hardware/dell/poweredge/r7515>

    # Host specific
    ./hardware-configuration.nix
    ./networking.nix
    ./nginx.nix
    ./packages.nix
    ./zfs.nix

    # Zentire modules
    ./modules/bitwarden.nix
    ./modules/boot-zfs.nix
    ./modules/borgbackup.nix
    ./modules/docker.nix
    ./modules/localization.nix
    ./modules/mail.nix
    ./modules/netdata.nix
    ./modules/packages.nix
    ./modules/pihole.nix
    ./modules/plex.nix
    ./modules/raid.nix
    ./modules/security.nix
    ./modules/services.nix
    ./modules/systemd-email.nix
    ./modules/upgrade-check.nix
    ./modules/users.nix
    ./modules/wordpress.nix
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

