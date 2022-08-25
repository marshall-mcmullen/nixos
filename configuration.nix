{ config, pkgs, ... }:
{
  imports =
    [
      <nixos-hardware/framework>
      ./boot.nix
      ./borgbackup.nix
      ./desktop.nix
      ./fonts.nix
      ./hardware-configuration.nix
      ./localization.nix
      ./mail.nix
      ./networking.nix
      ./packages.nix
      ./power.nix
      ./security.nix
      ./services.nix
      ./sound.nix
      ./systemd-email.nix
      ./users.nix
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
