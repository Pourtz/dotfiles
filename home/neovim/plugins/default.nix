{ config, pkgs, ... }:
{
  imports = [
    ./latex.nix
    ./luasnip.nix
    ./completion.nix
  ];
  programs.nixvim = {
    nixpkgs.pkgs = pkgs;

    plugins = {
      nix.enable = true;

      lualine = {
        enable = true;
        settings.options = {
          always_divide_middle = false;
          globalstatus = true;
        };
      };

      notify.enable = true;

      nvim-autopairs.enable = true;

      trim.enable = true;

      rainbow-delimiters.enable = true;

      # parinfer-rust.enable = true;

      project-nvim = {
        enable = true;
        enableTelescope = true;
      };

      neogit.enable = true;

      which-key.enable = true;

      direnv.enable = true;

      telescope.enable = true;

      treesitter = {
        enable = true;
        highlight.enable = false;
      };
      treesitter-context.enable = true;

      neo-tree.enable = true;

      lsp = {
        enable = true;
        servers = {
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
            # config = {
            #   settings.rust-analyzer.check.command = "clippy";
            # };
          };
        };
        # inlayHints.enable = true;
        # inlineCompletion.enable = true;
        # completion.enable = true;
      };

      web-devicons.enable = true;

      toggleterm = {
        enable = true;
        settings = {
          auto_scroll = true;
          autochdir = true;
          close_on_exit = true;
          direction = "horizontal";
          hide_numbers = true;
          shell = "fish";
        };
      };

      mini = {
        enable = true;
        modules = {
          diff.view.style = "number";
        };
      };

      orgmode.enable = true;

      origami.enable = true;
    };
  };
}
