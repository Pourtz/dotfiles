{ config, lib, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "JetBrains Mono";
        size = 10;
      };
      cursor = {
        style = {
          shape = "Underline";
          blinking = "Off";
        };
        vi_mode_style = "Block";
        unfocused_hollow = false;
      };
      live_config_reload = true;
      shell = {
        program = "${pkgs.fish}/bin/fish";
        args = [ "--login" ];
      };
      "import" = [ "~/.config/alacritty/catppuccin-mocha.toml" ];
    };
  };
  home.file.".config/alacritty/catppuccin-mocha.toml".source =
    ./catppuccin-mocha.toml;
}
