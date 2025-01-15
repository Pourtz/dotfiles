{ config, lib, pkgs, ... }:
{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 25565 ];
    allowedUDPPortRanges = [
      { from = 25565; to = 25565; }
    ];
  };
  networking.nftables.enable = true;
}
