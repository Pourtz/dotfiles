{
  imports = [
    ./latex.nix
    ./luasnip.nix
    ./completion.nix
  ];
  programs.nixvim = {
    # Lazy plugin manager
    plugins = {
      nix.enable = true;
      lualine.enable = true;

      notify.enable = true;
      # numbertoggle.enable = true;
      nvim-autopairs.enable = true;
      trim.enable = true;
      rainbow-delimiters.enable = true;
      # project-nvim.enable = true;
      neogit.enable = true;
      mini = {
        enable = true;
        # modules = {
        # };
      };
      indent-o-matic = {
        enable = true;
        settings.skip_multiline = true;
      };
      which-key.enable = true;

      telescope.enable = true;
      treesitter.enable = true;

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

      # Default kickstart.nvim
      # sleuth.enable = true;
      todo-comments = {
        enable = true;
        settings.signs = true;
      };
    };
  };
}
