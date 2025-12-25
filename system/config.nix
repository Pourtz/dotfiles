# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{ config, lib, pkgs, ... }: {
  imports = [
    ./gnome.nix
    ./sway.nix
  ];

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2w";
    };
  };

  boot = {
    loader = {
      systemd-boot = { enable = true; };
      efi = { canTouchEfiVariables = true; };
    };
    supportedFilesystems = [ "btrfs" "ntfs" ];
    kernelParams = [ "quiet" ];
    consoleLogLevel = 3;
  };

  services.logind.settings.Login.HandlePowerKey = "suspend";

  # Enable all firmware regardless of license
  hardware.enableAllFirmware = true;

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Santiago";

  # Internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_CL.UTF-8";
    LC_IDENTIFICATION = "es_CL.UTF-8";
    LC_MEASUREMENT = "es_CL.UTF-8";
    LC_MONETARY = "es_CL.UTF-8";
    LC_NAME = "es_CL.UTF-8";
    LC_NUMERIC = "es_CL.UTF-8";
    LC_PAPER = "es_CL.UTF-8";
    LC_TELEPHONE = "es_CL.UTF-8";
    LC_TIME = "es_CL.UTF-8";
  };

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Don't forget to set a password with ‘passwd’.
  users.users.pourtz = {
    isNormalUser = true;
    description = "Pablo";
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ neovim git ];

  security.polkit.enable = true;

  programs.ssh.startAgent = true;

  # List services that you want to enable:
  services.udisks2.enable = true;
  services.ratbagd.enable = true;
  services.onedrive.enable = true;
  services.displayManager.gdm.enable = true;

  services.xserver = {
    enable = true;
    # Configure keymap
    xkb = {
      layout = "latam,us";
      options = "ctrl:swapcaps,grp:win_space_toggle";
    };
  };
}
