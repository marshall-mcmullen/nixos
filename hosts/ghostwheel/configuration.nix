{ config, pkgs, ... }:

{
  imports = [
    <nixos-hardware/dell/poweredge/r7515>

    # Host specific
    ./hardware-configuration.nix
    ./networking.nix
    ./nginx.nix
    ./packages.nix
    ./raid.nix
    ./zfs.nix

    # Netherrack modules
    ./modules/acme.nix
    ./modules/bitwarden.nix
    ./modules/boot-zfs.nix
    ./modules/borgbackup.nix
    ./modules/cloudflared.nix
    ./modules/docker.nix
    ./modules/gc.nix
    ./modules/irqbalance.nix
    ./modules/localization.nix
    ./modules/mail.nix
    ./modules/netdata.nix
    ./modules/packages.nix
    ./modules/pihole.nix
    ./modules/plex.nix
    ./modules/security.nix
    ./modules/sshd-2fa.nix
    ./modules/systemd-email.nix
    ./modules/upgrade-check.nix
    ./modules/users.nix
    ./modules/wordpress.nix
    ./modules/zfs-monitor.nix
  ];

  #===============#
  # DO NOT MODIFY #
  #===============#

  # Optimize Nix storage
  nix.settings.auto-optimise-store = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix).
  system.copySystemConfiguration = true;

  # Set this to the current release version
  system.stateVersion = "22.05"; # Did you read the comment?
}

