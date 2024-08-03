{ pkgs, lib, config, ... }:

{
  boot = {
    loader.timeout = 2;

    loader.systemd-boot = {
      enable = true;
      consoleMode = "2";
      memtest86.enable = true;
    };

    loader.efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };

    plymouth.enable = true;
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    kernelParams = [ "noresume" "resume=none" ];
    supportedFilesystems = [ "zfs" ];

    loader.generationsDir.copyKernels = true;
  };
}
