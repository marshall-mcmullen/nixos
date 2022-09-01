{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.nodePackages.flood
  ];
}
