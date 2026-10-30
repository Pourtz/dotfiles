{ config, lib, pkgs, ... }: {
  programs.kitty = {
    enable = true;
    settings = {
      # Font
      font_family = "JetBrains Mono NL";
      font_size = 10;
      # Cursor
      cursor_shape = "underline";
      cursor_shape_unfocused = "hollow";
      cursor_blink_interval = "0";

      shell = "${pkgs.fish}/bin/fish --login";
      shell_integration = "enabled";

      #Tabs
      tab_bar_min_tabs = 2;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };

    enableGitIntegration = true;
    themeFile = "Catppuccin-Mocha";
  };
}
