{ config, pkgs, lib, ... }:
{
    nixpkgs.localSystem = {
        gcc.arch = "native";
	gcc.tune = "native";
	system = "x86_64-linux";
    };
}
