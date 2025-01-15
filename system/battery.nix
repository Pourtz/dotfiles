{ config, lib, pkgs, ... }:
{
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    # See https://linrunner.de/tlp for all supported options.
    settings = {
      START_CHARGE_THRESH_BAT0 = 30;
      STOP_CHARGE_THRESH_BAT0 = 90;
    };
  };
}
