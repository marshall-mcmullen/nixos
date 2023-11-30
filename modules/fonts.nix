{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
    noto-fonts-emoji
    liberation_ttf
    powerline-fonts
  ];
}
