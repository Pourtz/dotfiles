{ config, pkgs, lib, ... }:
let scripts-folder = "$HOME/.config/scripts";
in {
  home.packages = with pkgs; [
    tofi # alternative to dmenu
    dash # fast shell

    # fuentes
    jetbrains-mono
    terminus_font
  ];

  services.blueman-applet.enable = true;

  # MAKO
  services.mako = {
    enable = true;
    defaultTimeout = 10000;

    # Catppuccin mocha
    backgroundColor = "#1e1e2e";
    textColor = "#cdd6f4";
    borderColor = "#89b4fa";
    progressColor = "over #313244";
  };

  # TOFI
  home.file.".config/tofi/config".source = tofi/config;

  # SWAY
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  xdg.configFile."sway/config".source = lib.mkForce ./config;
  home.file.".config/scripts" = {
    source = ./scripts;
    recursive = true;
    executable = true;
  };

  # WAYBAR
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        modules-left = [ "sway/workspaces" "sway/mode" "sway/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "battery" "tray" ];

        "sway/workspaces" = { format = "{icon}"; };
        "sway/mode" = { format = ''<span style="italic">{}</span>''; };
        "sway/window" = {
          max-lenght = 10;
          tooltip = false;
        };
        "tray" = { spacing = 10; };
        "clock" = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format-alt = "{:%d-%m-%Y}";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "" "" "" "" "" ];
        };
      };
    };
  };
  home.file.".config/waybar" = {
    source = ./waybar;
    recursive = true;
  };

  # EWW
  programs.eww = {
    enable = true;
    package = pkgs.eww;
    configDir = ./eww;
  };
}
