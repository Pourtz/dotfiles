{ config, lib, pkgs, ... }:
{
  # Printing
  services.printing = {
    enable = true;
    drivers = [pkgs.hplipWithPlugin];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
