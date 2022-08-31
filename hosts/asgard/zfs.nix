{ ... }:

{
  boot.extraModprobeConfig = ''

    #  60% = 39270213600
    #  75% = 49087767000
    #  80% = 52360284800
    # 100% = 65450356000
    options zfs zfs_arc_min=39270213600
    options zfs zfs_arc_max=52360284800
  '';
}
