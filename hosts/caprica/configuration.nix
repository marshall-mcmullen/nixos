{ config, pkgs, ... }:

{ 
  networking.hostName = "caprica";

  nix.settings.system-features = [ "nixos-test" "benchmark" "big-parallel" "kvm" "gccarch-native" ];

  imports = [
    <nixos-hardware/framework/13-inch/12th-gen-intel>

    # Host specific
    ./hardware-configuration.nix
    ./kernel-modules.nix
    ./packages.nix
    ./services.nix

    # Netherrack modules
    ./modules/chrome.nix
    ./modules/boot-systemd.nix
    ./modules/borgbackup.nix
    ./modules/docker.nix
    ./modules/fonts.nix
    ./modules/gc.nix
    ./modules/gnome-i3.nix
    ./modules/irqbalance.nix
    ./modules/localization.nix
    ./modules/mail.nix
    ./modules/netdata.nix
    ./modules/networking.nix
    ./modules/opengl.nix
    ./modules/packages.nix
    ./modules/power.nix
    ./modules/security.nix
    ./modules/sshd.nix
    ./modules/sound.nix
    ./modules/systemd-email.nix
    ./modules/upgrade-check.nix
    ./modules/users.nix
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
  system.stateVersion = "22.05";
}
