# Some packages don't built properly with -march/-mtune=native so override them
let
  pkgs = import <nixpkgs> {
    localSystem = {
      gcc.arch = "";
      gcc.tune = "";
      system = "x86_64-linux";
    };
  };
in
  pkgs.openssl
