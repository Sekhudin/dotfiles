{ config, pkgs, ... }:

{
  home.file = {
    ".local/share/applications/kitty.desktop".source = ../.desktop/kitty.desktop;
    ".local/share/applications/vscode.desktop".source = ../.desktop/vscode.desktop;
    ".local/share/applications/vscode-work.desktop".source = ../.desktop/vscode-work.desktop;
    ".local/share/applications/vscode-me.desktop".source = ../.desktop/vscode-me.desktop;
  };
}
