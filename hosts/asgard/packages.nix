{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    pkgs.nodePackages.flood
    ansi2html
    rrsync
    rsync
    unrar
  ];
}
