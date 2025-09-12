{ config, pkgs, ... }:

{
  home.file = {
    ".local/share/applications/kitty.desktop".source = ../.desktop/kitty.desktop;
  };
}
