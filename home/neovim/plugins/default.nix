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
      trim.enable = true;
      rainbow-delimiters.enable = true;
      project-nvim = {
        enable = true;
        enableTelescope = true;
      };
      neogit.enable = true;
      indent-o-matic = {
        enable = true;
        settings.skip_multiline = true;
      };
      which-key.enable = true;

      direnv.enable = true;

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

      todo-comments = {
        enable = true;
        settings.signs = true;
      };

      mini = {
        enable = true;
        modules = {
          # starter = {
          #   content_hooks = {
          #     "__unkeyed-1.adding_bullet" = {
          #       __raw = "require('mini.starter').gen_hook.adding_bullet()";
          #     };
          #     "__unkeyed-2.indexing" = {
          #       __raw = "require('mini.starter').gen_hook.indexing('all', { 'Builtin actions' })";
          #     };
          #     "__unkeyed-3.padding" = {
          #       __raw = "require('mini.starter').gen_hook.aligning('center', 'center')";
          #     };
          #   };
          #   evaluate_single = true;
          #   header = ''
          #     ███╗   ██╗██╗██╗  ██╗██╗   ██╗██╗███╗   ███╗
          #     ████╗  ██║██║╚██╗██╔╝██║   ██║██║████╗ ████║
          #     ██╔██╗ ██║██║ ╚███╔╝ ██║   ██║██║██╔████╔██║
          #     ██║╚██╗██║██║ ██╔██╗ ╚██╗ ██╔╝██║██║╚██╔╝██║
          #     ██║ ╚████║██║██╔╝ ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║
          #   '';
          #   items = {
          #     "__unkeyed-1.buildtin_actions" = {
          #       __raw = "require('mini.starter').sections.builtin_actions()";
          #     };
          #     "__unkeyed-2.recent_files_current_directory" = {
          #       __raw = "require('mini.starter').sections.recent_files(10, false)";
          #     };
          #     "__unkeyed-3.recent_files" = {
          #       __raw = "require('mini.starter').sections.recent_files(10, true)";
          #     };
          #     "__unkeyed-4.sessions" = {
          #       __raw = "require('mini.starter').sections.sessions(5, true)";
          #     };
          #   };
          # };
          diff.view.style = "number";
        };
      };

      cord = {
        enable = true;
        settings = {
          editor.tooltip = "Neovim";
          text.workspace = "In some repo";
        };
      };
    };
  };
}
