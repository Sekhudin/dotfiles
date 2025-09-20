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

  xdg.desktopEntries.kitty = {
    name = "Kitty";
    genericName = "Terminal emulator";
    comment = "Fast, feature-rich, GPU based terminal";
    exec = "nixgl kitty";
    icon = "kitty";
    type = "Application";
    terminal = false;
    startupNotify = true;
    categories = [ "System" "TerminalEmulator" ];
  };

  xdg.desktopEntries.kitty-open = {
    name = "Kitty URL Launcher";
    genericName = "Terminal emulator";
    comment = "Open URLs with kitty";
    exec = "nixgl kitty +open %U";
    icon = "kitty";
    type = "Application";
    terminal = false;
    startupNotify = true;
    categories = [ "System" "TerminalEmulator" ];
    noDisplay = true;
    settings = {
      Keywords = "terminal;kitty";
    };
    mimeType = [
      "image/*"
      "application/x-sh"
      "application/x-shellscript"
      "inode/directory"
      "text/*"
      "x-scheme-handler/kitty"
      "x-scheme-handler/ssh"
    ];
  };
}
