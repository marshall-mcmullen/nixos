{ config, ... }:

{
  boot = {
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    supportedFilesystems = [ "zfs" ];

    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        copyKernels = true;
        device = "nodev";
        efiSupport = true;
        enable = true;
        version = 2;
        zfsSupport = true;
      };

      generationsDir.copyKernels = true;
    };
  };
}
