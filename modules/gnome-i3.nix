{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    pkgs.gnome.gnome-bluetooth
    pkgs.gnome.gnome-terminal
    pkgs.gnome.gnome-tweaks
    pkgs.xorg.xkill
  ];

  services = {
    libinput.touchpad.naturalScrolling = true;
    xserver = {
      enable = true;
      xkb.layout = "us";
      displayManager.gdm.enable = true;
      displayManager.gdm.wayland = false;
      desktopManager.gnome.enable = false;

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          albert
          i3status
          i3lock-color
          xautolock
        ];
      };
    };
  };

  # Various desktop apps require gnome services to be running
  services.accounts-daemon.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  programs.seahorse.enable = true;

  # Automatically unlock gnome_keyring (gdm is supposed to do this but doesn't when using i3 wm).
  security.pam.services.gnome_keyring.text = ''
    auth     optional    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so
    session  optional    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so auto_start
    password optional    ${pkgs.gnome.gnome-keyring}/lib/security/pam_gnome_keyring.so
  '';
}
