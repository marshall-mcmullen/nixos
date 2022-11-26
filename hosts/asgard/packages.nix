{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.nodePackages.flood
    ansi2html
    unrar
  ];
}
