{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      if [ -f ~/.bashrc.manual ]; then
        source ~/.bashrc.manual
      fi
    '';
  };

  home.file = {
    ".bashrc.manual".source = ../config/extra-shellrc.sh;
  };
}