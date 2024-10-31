{
  programs.nixvim = {
    plugins.cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "calc"; }
          { name = "fuzzy_path"; }
          { name = "nvim_lsp"; }
          { name = "nvim_lua"; }
        ];
        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
        completion.completeopt = "menu,menuone,noinsert";
        # TODO: map autocompletion controls differently
        mapping = {
          # Expand or accept the snippet
          "<CR>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                if require("luasnip").expandable() then
                  require("luasnip").expand()
                else
                  cmp.confirm({select = true,})
                end
              else
                fallback()
              end
            end)
          '';

          # Select the next item or jump forward in the snippet
          "<Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").locally_jumpable(1) then
                require("luasnip").jump(1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          # Select the previous item or jump backward in the snippet
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").locally_jumpable(-1) then
                require("luasnip").jump(-1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          # Change choice in LuaSnip choice nodes
          "<C-E>" = ''
            cmp.mapping(function(fallback)
              if require("luasnip").choice_active() then
                require("luasnip").change_choice(1)
              else
                fallback()
              end
            end, { "i", "s" })
          '';

          # Scroll the documentation window [b]ack / [f]orward
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";

          # Manually trigger a completion from nvim-cmp.
          #  Generally you don't need this, because nvim-cmp will display
          #  completions whenever it has completion options available.
          "<C-Space>" = "cmp.mapping.complete {}";

          # For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          #    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        };
      };
    };
  };
}
