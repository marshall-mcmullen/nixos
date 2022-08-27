{ ... }:

{
  users.users.marshall = {
    isNormalUser = true;
    extraGroups = [ 
      "adbusers"
      "input"
      "wheel"
    ];
  };
}
