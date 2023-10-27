{ config, ... }:

{
  boot = {
    kernelPackages = config.boot.zfs.package.latestCompatibleLinuxPackages;
    kernelParams = [ "noresume" "resume=none" ];
    supportedFilesystems = [ "zfs" ];

    loader = {
      efi = {
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
	efiInstallAsRemovable = true;
        copyKernels = true;
        devices = [ "nodev" ];
        efiSupport = true;
        enable = true;
        zfsSupport = true;
      };

      generationsDir.copyKernels = true;
    };
  };
}
