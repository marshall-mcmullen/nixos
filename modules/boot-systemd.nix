{ pkgs, lib, config, ... }:
{

  boot.loader.timeout = 2;

  boot.loader.systemd-boot = {
    enable = true;
    consoleMode = "2";
    memtest86.enable = true;
  };

  boot.loader.efi.canTouchEfiVariables = true;
  boot.plymouth.enable = true;
}
