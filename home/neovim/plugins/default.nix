{ config, ... }:
{
  imports = [
    ./latex.nix
    ./luasnip.nix
    ./completion.nix
  ];
  programs.nixvim = {
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

      # trim.enable = true;

      rainbow-delimiters.enable = true;

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
        folding.enable = true;
        highlight.enable = true;
        indent.enable = true;
      };

      neo-tree.enable = true;

      lsp.enable = true;

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
    };
  };
}
