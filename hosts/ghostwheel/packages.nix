{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gptfdisk
    google-authenticator
    rrsync
    rsync
  ];
}
