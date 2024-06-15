{ config, pkgs, ... }: {
  home.sessionVariables = { DOOMDIR = "$HOME/.config/doom"; };

  home.packages = with pkgs; [
    ## Emacs itself
    binutils # native-comp needs 'as', provided by this
    # 28.2 + native-comp
    ((emacsPackagesFor emacsNativeComp).emacsWithPackages
      (epkgs: [ epkgs.vterm ]))

    ## Doom dependencies
    git
    (ripgrep.override { withPCRE2 = true; })
    gnutls # for TLS connectivity

    ## Optional dependencies
    fd # faster projectile indexing
    imagemagick # for image-dired
    pinentry-emacs
    zstd # for undo-fu-session/undo-tree compression
    emacs-all-the-icons-fonts

    ## Module dependencies
    # :tools editorconfig
    editorconfig-core-c # per-project style config
    # :lang latex & :lang org (latex previews)
    texlab
    texliveFull
    # :lang markdown
    pandoc
    # :lang nix
    nixfmt-classic
    # :lang sh
    shellcheck
    shfmt
    # :term vterm
    gnumake
    cmakeMinimal
    # :tools direnv
    direnv
    # :lang cc
    clang-tools
    glslang
    ccls
    cmake-language-server
    # :lang python
    python3
    black
    python311Packages.pyflakes
    isort
    pipenv
    python311Packages.nose
    python311Packages.pytest
    python311Packages.setuptools
  ];
}
