{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ docker ];

  virtualisation = {
    oci-containers.backend = "docker";

    docker  = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      #dockerCompat = true;
    };
  };
}
