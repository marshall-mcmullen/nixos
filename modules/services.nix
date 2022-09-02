{ ... }:

{
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";
  services.irqbalance.enable = true;
}
