{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    themeFile = "atelier-cave-dark";
    enableGitIntegration = true;
    shellIntegration = {
      mode = "disabled";
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    font = {
      name = "JetbrainsMono Nerd Font";
      size = 12;
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
