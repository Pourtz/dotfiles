{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [ "~/.config/alacritty/catppuccin-mocha.toml" ];
        live_config_reload = true;
      };
      font = {
        normal.family = "JetBrains Mono";
        size = 9;
      };
      cursor = {
        style = {
          shape = "Underline";
          blinking = "Off";
        };
        vi_mode_style = "Block";
        unfocused_hollow = false;
      };
      terminal = {
        shell = {
          program = "${pkgs.fish}/bin/fish";
          args = [ "--login" ];
        };
      };
    };
  };
  home.file.".config/alacritty/catppuccin-mocha.toml".source =
    ./catppuccin-mocha.toml;
}
