{
  programs.nixvim = {
    # mini.basics for common presets
    plugins.mini = {
      enable = true;
      modules.basics.autocommands = {
        # Basic autocommands (highlight on yank, start Insert in terminal, ...)
        basic = true;
        # Set 'relativenumber' only in linewise and blockwise Visual mode
        relnum_in_visual_mode = true;
      };
    };
    # # Basic Autocommands
    # autoGroups = { kickstart-highlight-yank = { clear = true; }; };
    # autoCmd = [
    #   { # Highlight when yanking (copying) text
    #   event = "TextYankPost";
    #   desc = "Highlight when yanking (copying) text";
    #   group = "kickstart-highlight-yank";
    #   callback = { __raw = "function() vim.highlight.on_yank() end"; };
    #   }
    # ];
  };
}
