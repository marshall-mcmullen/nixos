{ ... }:

{
  services.openssh = {
    enable = true;
    PermitRootLogin = "yes";
    PasswordAuthentication = true;
  };
}
