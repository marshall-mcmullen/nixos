{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wordpress
  ];
}
