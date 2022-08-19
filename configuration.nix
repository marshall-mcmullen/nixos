{ config, pkgs, ... }:
{
  imports =
    [ 
      <nixos-hardware/framework>
      ./boot.nix
      #./desktop.nix
      ./sway.nix
      ./fonts.nix
      ./hardware-configuration.nix
      ./localization.nix
      ./networking.nix
      ./packages.nix
      ./power.nix
      ./services.nix 
      ./sound.nix
      ./users.nix
    ];

  # Optimize Nix storage
  nix.autoOptimiseStore = true;

  # Some programs need SUID wrappers.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
