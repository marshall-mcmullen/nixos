#=====================================================
#
# Services
#
#=====================================================

{ ... }:

{
  services.fprintd.enable    = true;
  services.fwupd.enable      = true;
  services.irqbalance.enable = true;
  services.openssh.enable    = true;
  services.printing.enable   = true;
}
