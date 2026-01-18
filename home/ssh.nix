{ config, pkgs, lib, ... }: {
  services.ssh-agent.enable = true;
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
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
      "p.codeberg.org" = {
        hostname = "codeberg.org";
        user = "git";
        identitiesOnly = true;
        identityFile = [ "/home/pourtz/.ssh/personal" ];
      };
    };
  };
}
