{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    google-authenticator
    wordpress
  ];
}
