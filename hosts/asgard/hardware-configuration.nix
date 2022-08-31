# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "mpt3sas" "xhci_pci" "ahci" "usbhid" "usb_storage", "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "rpool/nixos/root";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/var/lib" =
    { device = "rpool/nixos/var/lib";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/var/log" =
    { device = "rpool/nixos/var/log";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/home" =
    { device = "rpool/home";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/boot" =
    { device = "rpool/nixos/boot";
      fsType = "zfs"; options = [ "zfsutil" "X-mount.mkdir" ];
    };

  fileSystems."/boot/efi" =
    { device = "/dev/md0";
      fsType = "vfat";
    };

  swapDevices = [ ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno2.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0f0.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0f1.useDHCP = lib.mkDefault true;
  # networking.interfaces.veth42b7155.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
