{
  programs.nixvim = {
    # mini.basics for common presets
    plugins.mini = {
      enable = true;
      modules.basics.options = {
        # Basic options ('number', 'ignorecase', and many more)
        basic = true;
        # # Extra UI features ('winblend', 'cmdheight=0', ...)
        # extra_ui = true;
        # # Presets for window borders ('single', 'double', ...)
        # win_borders = "double";
      };
    };
    opts = {
      # Soft wrapping of lines
      textwidth = 0;
      wrapmargin = 0;
      wrap = true;
      linebreak = true;
      breakindent = true;
      # Preview substitutions live, as you type!
      inccommand = "split";
      # Sets how neovim will display certain whitespace characters in the editor
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      # Save undo history
      undofile = true;
      # Decrease update time
      updatetime = 250;
      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;
      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 5;
    };
  };
}
