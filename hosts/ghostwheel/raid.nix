{ ... }:

{
  environment.etc."mdadm.conf".text = ''
    MAILADDR root
    ARRAY /dev/md0 metadata=1.0 UUID=a7d0aeb4:e0fcd644:353077f7:53a2d2ef
  '';

  boot.initrd.services.swraid.mdadmConf = ''
    ARRAY /dev/md0 metadata=1.0 UUID=a7d0aeb4:e0fcd644:353077f7:53a2d2ef
  ''; 
}
