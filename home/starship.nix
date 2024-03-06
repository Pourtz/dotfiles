{ config, pkgs, lib, ... }: {
  programs.starship =
    let flavour = "mocha"; # One of `latte`, `frappe`, `macchiato`, or `mocha`
    in {
      enable = true;
      enableFishIntegration = true;
      settings = {
        palette = "catppuccin_${flavour}";
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_commit"
          "$git_state"
          "$git_metrics"
          "$git_status"
          "$docker_context"
          "$package"
          "$c"
          "$cmake"
          "$golang"
          "$haskell"
          "$java"
          "$lua"
          "$perl"
          "$python"
          "$rust"
          "$nix_shell"
          "$sudo"
          "$cmd_duration"
          "$status"
          "$line_break"
          "$jobs"
          "$container"
          "$character"
        ];
        add_newline = false;
        username = {
          format = "[$user]($style)";
          show_always = true;
        };
        hostname = {
          ssh_only = false;
          ssh_symbol = " (ssh)";
          format = "@[$hostname$ssh_symbol]($style) ";
        };
        directory = {
          style = "bold blue";
          read_only = " ro";
          use_os_path_sep = false;
        };
        sudo = {
          format = "\\[[$symbol]($style)\\]";
          symbol = "sudo";
          disabled = false;
        };
        cmd_duration.format = "\\[[$duration]($style)\\]";
        status = {
          format = "\\[[$status]($style)\\] ";
          disabled = false;
        };
        character = {
          success_symbol = "[>](bold green)";
          error_symbol = "[x](bold red)";
          vimcmd_symbol = "[<](bold green)";
        };
        # git
        git_branch = {
          format = "\\[[$symbol$branch]($style)\\]";
          symbol = "git ";
        };
        git_commit.tag_symbol = " tag ";
        git_state.format =
          "\\([$state( $progress_current/$progress_total)]($style)\\) ";
        git_status = {
          format = "([\\[$all_status$ahead_behind\\]]($style))";
          ahead = ">";
          behind = "<";
          diverged = "<>";
          renamed = "r";
          deleted = "x";
        };

        docker_context = {
          format = "\\[[$symbol$context]($style)\\]";
          symbol = "docker ";
        };
        package = {
          format = "\\[[$symbol$version]($style)\\]";
          symbol = "pkg ";
        };
        c = {
          format = "\\[[$symbol($version(-$name))]($style)\\]";
          symbol = "C ";
        };
        cmake = {
          format = "\\[[$symbol($version)]($style)\\]";
          symbol = "cmake ";
        };
        golang = {
          format = "\\[[$symbol($version)]($style)\\]";
          symbol = "go ";
        };
        haskell.format = "\\[[$symbol($version)]($style)\\]";
        java = {
          format = "\\[[$symbol($version)]($style)\\]";
          symbol = "java ";
        };
        lua = {
          format = "\\[[$symbol($version)]($style)\\]";
          symbol = "lua ";
        };
        perl = {
          format = "\\[[$symbol($version)]($style)\\]";
          symbol = "pl ";
        };
        python = {
          format =
            "\\[[\${symbol}\${pyenv_prefix}(\${version})(\\($virtualenv\\))]($style)\\]";
          symbol = "py ";
        };
        rust = {
          format = "\\[[$symbol($version)]($style)\\]";
          symbol = "rs ";
        };
        nix_shell = {
          format = "\\[[$symbol$state( \\($name\\))]($style)\\]";
          symbol = "nix ";
        };
      } // builtins.fromTOML (builtins.readFile (pkgs.fetchFromGitHub {
        owner = "catppuccin";
        repo = "starship";
        rev = "5629d23";
        sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
      } + /palettes/${flavour}.toml));
    };
}
