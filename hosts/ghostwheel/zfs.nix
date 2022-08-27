{ ... }:

{
  boot.extraModprobeConfig = ''
    options zfs zfs_arc_min=52360284800
    options zfs zfs_arc_max=58905320400
  '';
}
