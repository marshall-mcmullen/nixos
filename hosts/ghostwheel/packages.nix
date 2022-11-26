{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    google-authenticator
    rrsync
    rsync
  ];
}
