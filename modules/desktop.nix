{ config, pkgs, ... }:

{
  home.file = {
    ".local/share/applications/kitty.desktop".source = ../.desktop/kitty.desktop;
    ".local/share/applications/vscode.desktop".source = ../.desktop/vscode.desktop;
  };
}
