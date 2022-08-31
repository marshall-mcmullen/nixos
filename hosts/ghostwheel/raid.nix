{ ... }:

{
  environment.etc."mdadm.conf".text = ''
    MAILADDR root
    ARRAY /dev/md0 metadata=1.0 name=ghostwheel:0 UUID=560c6660:1c09356e:fb07b3c6:b268e3d9
  '';

  boot.initrd.services.swraid.mdadmConf = ''
    ARRAY /dev/md0 metadata=1.0 name=ghostwheel:0 UUID=560c6660:1c09356e:fb07b3c6:b268e3d9
  ''; 
}
