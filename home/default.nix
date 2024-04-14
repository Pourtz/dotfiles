{ config, pkgs, lib, ... }@inputs: {
  imports = [ ./alacritty ./starship.nix ./sway ./doom-emacs ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pourtz";
  home.homeDirectory = "/home/pourtz";
  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    neovim

    firefox
    qutebrowser
    discord
    spotify
    zathura
    sioyek
    piper # mouse config
    feh
    # mpv
    libreoffice-fresh
    # inkscape
    godot_4
    # itch
    telegram-desktop

    # terminal things
    eza
    bat
    bat-extras.batman
    neofetch
    bottom
    direnv
    unzip
    just
    nix-output-monitor

    # sage

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  programs.gpg.enable = true;

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/onedrive/config".text = ''
      sync_dir = "~/OneDrive"
    '';
    ".config/bat" = {
      source = ./bat;
      recursive = true;
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
  };
  home.sessionPath = [ "$HOME/.config/emacs/bin" ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      if [ "$SHLVL" = "1" ]; then
          exec fish
      fi
    '';
  };

  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "p.github.com" = {
        hostname = "github.com";
        user = "git";
        identitiesOnly = true;
        identityFile = [ "/home/pourtz/.ssh/personal" ];
      };
      "u.github.com" = {
        hostname = "github.com";
        user = "git";
        identitiesOnly = true;
        identityFile = [ "/home/pourtz/.ssh/institucional" ];
      };
      "u.gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identitiesOnly = true;
        identityFile = [ "/home/pourtz/.ssh/institucional" ];
      };
    };
  };

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "exa -l --group-directories-first";
      sl = "exa -la --group-directories-first";
      man = "batman";
    };
    shellInit = "set -U fish_greeting";
  };

  programs.git = {
    enable = true;
    userName = "Pourtz";
    userEmail = "pany182001@gmail.com";
    lfs.enable = true;
    extraConfig.init.defaultBranch = "main";
  };

  # fonts
  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        # "application/pdf" = "org.pwmt.zathura.desktop";
        "x-scheme-handler/tg" = "org.telegram.desktop.desktop";
      };
    };
  };
}
