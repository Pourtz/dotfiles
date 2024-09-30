{
  programs.nixvim = {
    opts = {
      # Make relative line numbers default
      number = true;
      relativenumber = true;
      # Enable mouse mode, can be useful for resizing splits for example
      mouse = "a";
      # Don't show the mode, since it's already in the status line
      showmode = false;
      # Enable break indent
      breakindent = true;
      # Save undo history
      undofile = true;
      # Case-insensitive searching UNLESS \C or one or more capital letters in the search term
      ignorecase = true;
      smartcase = true;
      # Keep signcolumn on by default
      signcolumn = "yes";
      # Decrease update time
      updatetime = 250;
      # Decrease mapped sequence wait time
      # Displays which-key popup sooner
      timeoutlen = 300;
      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;
      # Sets how neovim will display certain whitespace characters in the editor
      list = true;
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
      # Preview substitutions live, as you type!
      inccommand = "split";
      # Show which line your cursor is on
      cursorline = true;
      # Minimal number of screen lines to keep above and below the cursor
      scrolloff = 10;

      hlsearch = true;
    };

    keymaps = [
      { # Diagnostic keymaps
        mode = "n";
        key = "<leader>fs";
        action = ":w<Enter>";
        options.desc = "File saved";
      }
      { # Clear highlights on search when pressing <Esc> in normal mode
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      { # Diagnostic keymaps
        mode = "n";
        key = "<leader>q";
        action = { __raw = "vim.diagnostic.setloclist"; };
        options.desc = "Open diagnostic [Q]uickfix list";
      }
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w><C-h>";
        options.desc = "Move focus to the left window";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w><C-l>";
        options.desc = "Move focus to the right window";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w><C-j>";
        options.desc = "Move focus to the lower window";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w><C-k>";
        options.desc = "Move focus to the upper window";
      }
    ];

    # Basic Autocommands
    autoGroups = { kickstart-highlight-yank = { clear = true; }; };
    autoCmd = [
      { # Highlight when yanking (copying) text
      event = "TextYankPost";
      desc = "Highlight when yanking (copying) text";
      group = "kickstart-highlight-yank";
      callback = { __raw = "function() vim.highlight.on_yank() end"; };
    }
  ];
};
}
