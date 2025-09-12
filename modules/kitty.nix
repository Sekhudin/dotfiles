{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };
    settings = {
      enable_audio_bell = "no";
      confirm_os_window_close = 1;
      cursor_shape = "underline";
    };
    extraConfig = ''
      shell ${pkgs.zsh}/bin/zsh
    '';
  };
}
