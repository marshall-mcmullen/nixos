{ ... }:
{
  # Set default power options
  powerManagement = {
    enable = true;
    powertop.enable = true;
  };

  # Enable thermal data
  services.thermald.enable = true;
}
