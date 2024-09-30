{ config, pkgs, lib, inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./options.nix
    ./plugins
  ];
  # home.packages = with pkgs; [ gcc gnumake git ripgrep fd unzip ];
  programs.nixvim = {
    enable = true;

    # performance = {
    #   byteCompileLua = {
    #     enable = true;
    #     plugins = true;
    #   };
    #   combinePlugins.enable = true;
    # };

    globals = {
      # Set <space> as the leader key
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = false;
    };
    viAlias = true;
    vimAlias = true;

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    colorschemes.catppuccin.enable = true;
  };
}
