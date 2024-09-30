{
  programs.nixvim = {
    # LuaSnip
    plugins.luasnip = {
      enable = true;
      settings = {
        update_events = [ "TextChanged" "TextChangedI" ];
        enable_autosnippets = true;
        cut_selection_keys = "<Tab>";
      };
      fromLua = [ { paths = ./snippets; } ];
    };

    # Cmp
    plugins.cmp.settings.sources = [ { name = "luasnip"; } ];
  };
}
