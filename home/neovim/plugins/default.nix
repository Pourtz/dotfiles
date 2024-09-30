{
  imports = [
    ./latex.nix
    ./luasnip.nix
    ./completion.nix
  ];
  programs.nixvim = {
    # Lazy plugin manager
    plugins = {
      lualine.enable = true;
      nix.enable = true;
      notify.enable = true;
      numbertoggle.enable = true;
      nvim-autopairs.enable = true;
      trim.enable = true;
      rainbow-delimiters.enable = true;
      project-nvim.enable = true;
      neogit.enable = true;
      mini.enable = true;
      indent-o-matic.enable = true;
      which-key.enable = true;

      neo-tree.enable = true;
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
      sleuth.enable = true;
      todo-comments = {
        enable = true;
        settings.signs = true;
      };
    };
  };
}
