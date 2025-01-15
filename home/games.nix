{ config, pkgs, lib, ... }: {
  home.packages = with pkgs; [
    # godot_4
    itch
    prismlauncher
    heroic
    # xwiimote
  ];
}
