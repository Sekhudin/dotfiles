{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    silent = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
