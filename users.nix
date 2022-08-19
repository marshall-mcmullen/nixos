{ ... }:

{
  users.users.marshall = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
