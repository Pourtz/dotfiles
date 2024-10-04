{pkgs, ...}: {
  programs.nixvim = {
    # LuaSnip
    plugins.luasnip.filetypeExtend = {
      sty = [ "tex" ];
      cls = [ "tex" ];
    };

    # TeXpresso
    plugins.texpresso.enable = true;

    # Vimtex
    plugins.vimtex = {
      enable = true;
      texlivePackage = pkgs.texliveFull;
      settings = {
        view_method = "zathura";
        compiler_method = "latexmk";
      };
    };

    globals = {
      tex_conceal="abdmg";
      tex_flavor="latex";
    };

    opts.conceallevel = 0;

    # Disable nvim-autopairs in tex files
    plugins.nvim-autopairs.settings.disable_filetype = [ "tex" ];
  };
}
