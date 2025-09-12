{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
    
    };
  };

  home.file = {
    ".config/starship.toml".source = ../config/starship.toml
  };
}
