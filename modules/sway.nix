{ config, pkgs, lib, ... }:
{
  # configuring sway itself (assmung a display manager starts it)
  systemd.user.targets.sway-session = {
    description = "Sway compositor session";
    documentation = [ "man:systemd.special(7)" ];
    bindsTo = [ "graphical-session.target" ];
    wants = [ "graphical-session-pre.target" ];
    after = [ "graphical-session-pre.target" ];
  };

  programs.sway = {
    enable = true;
    extraPackages = with pkgs; [
      albert
      i3status
      libinput-gestures
      swaybg
      swayidle
      swaylock
      xdotool
    ];
    extraSessionCommands = ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
      eval $(gnome-keyring-daemon --start);
      export SSH_AUTH_SOCK;
    '';
  };

  # X Configuration
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.libinput.enable = true;
  services.xserver.displayManager.defaultSession = "sway";
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;

  # Enable Video Hardware Acceleration
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

  # Various desktop apps require gnome services to be running
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.accounts-daemon.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
}
