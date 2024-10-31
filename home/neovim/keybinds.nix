{
  programs.nixvim = {
    # mini.basics for common presets
    plugins.mini = {
      enable = true;
      modules.basics.mappings = {
        # # Basic mappings (better 'jk', save with Ctrl+S, ...)
        # basic = true;
        # Window navigation with <C-hjkl>, resize with <C-arrow>
        windows = true;
        # Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
        move_with_alt = true;
      };
    };

    plugins.which-key.settings.spec = [
      {
        __unkeyed-1 = "<leader>f";
        group = "File";
        mode = "n";
      }
      {
        __unkeyed-1 = "<leader>g";
        group = "Git";
        mode = "n";
      }
      {
        __unkeyed-1 = "<leader>o";
        group = "Open";
        mode = "n";
      }
      {
        __unkeyed-1 = "<leader>p";
        group = "Project";
        mode = "n";
      }
      {
        __unkeyed-1 = "<leader>b";
        group = "Buffer";
        mode = "n";
      }
    ];

    keymaps = [
      {
        mode = "n";
        key = "<leader>fs";
        action = "<cmd>w<CR>";
        options.desc = "Save file";
      }
      {
        mode = "n";
        key = "<leader>gg";
        action = { __raw = "require('neogit').open"; };
        options.desc = "Open neogit";
      }
      { # Clear highlights on search when pressing <Esc> in normal mode
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      {
        mode = "n";
        key = "<leader>ot";
        action = "<cmd>ToggleTerm<CR>";
        options.desc = "Open terminal";
      }
      {
        mode = "n";
        key = "<leader>pt";
        action = "<cmd>Neotree toggle<CR>";
        options.desc = "Toggle project tree";
      }
      {
        mode = "n";
        key = "<leader>pp";
        action = "<cmd>Telescope projects<CR>";
        options.desc = "Open project list";
      }
      {
        mode = "n";
        key = "<leader><leader>";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Find file";
      }
      {
        mode = "n";
        key = "<leader>bb";
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Open buffers";
      }
    ];
  };
}
