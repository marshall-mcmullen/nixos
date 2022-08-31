{ ... }:

{
  environment.etc."mdadm.conf".text = ''
    MAILADDR root
    ARRAY /dev/md0 metadata=1.0 name=asgard:0 UUID=21a37930:3c97b1f3:dcdf83ce:5761f6c8
  '';

  boot.initrd.services.swraid.mdadmConf = ''
    ARRAY /dev/md0 metadata=1.0 name=asgard:0 UUID=21a37930:3c97b1f3:dcdf83ce:5761f6c8
  ''; 
}
