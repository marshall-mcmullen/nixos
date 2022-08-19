{ config, pkgs, callPackage, ... }:
{
  # Link /libexec from derivations to /run/current-system/sw
  environment.pathsToLink = [ "libexec" ];
  
  # X Configuration
  services.xserver.enable  = true;
  services.xserver.layout = "us";
  services.xserver.exportConfiguration = true; # crate link /etc/X11/xorg.conf

  # Libinput
  services.xserver.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
    };
  };

  # Desktop Manager
  services.xserver.desktopManager = {
    xterm.enable = false;
    gnome.enable = true;
  };

  # Display Manager
  services.xserver.displayManager = {
    defaultSession = "none+i3";
  };

  # Window Manager
  services.xserver.windowManager.i3 = {
    enable = true;
    extraPackages = with pkgs; [
      i3status
      i3lock
      i3lock-color
    ];
  };

  # Video Hardware Acceleration
  hardware.video.hidpi.enable = true;
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      mesa_drivers
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
    ];
  };
}
