{ config, pkgs, lib, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    extraPackages = with pkgs; [
      intel-compute-runtime
      intel-media-driver
      mesa_drivers
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
