{ config, pkgs, ... }:

{ 
  networking.hostName = "caprica";
  
  imports = [
    <nixos-hardware/framework>

    # Host specific
    ./hardware-configuration.nix
    ./networking.nix
    ./packages.nix
    ./services.nix

    # Zentire modules
    ./modules/boot-systemd.nix
    ./modules/borgbackup.nix
    ./modules/fonts.nix
    ./modules/localization.nix
    ./modules/mail.nix
    ./modules/networking.nix
    ./modules/power.nix
    ./modules/security.nix
    ./modules/sound.nix
    ./modules/sway.nix
    ./modules/systemd-email.nix
    ./modules/upgrade-check.nix
    ./modules/users.nix
  ];

  # Optimize Nix storage
  nix.autoOptimiseStore = true;

  # Setup virtualization
  virtualisation.docker.enable = true;

  #===========================#
  # Don't touch after install #
  #===========================#

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix).
  system.copySystemConfiguration = true;

  # Set this to the current release version
  system.stateVersion = "22.05";
}
