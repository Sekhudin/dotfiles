{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    historyLimit = 10000;
    shell = "${pkgs.zsh}/bin/zsh";

    extraConfig = ''
      set -g prefix C-a
      unbind C-b
      bind C-a send-prefix
    '';
  };
}
