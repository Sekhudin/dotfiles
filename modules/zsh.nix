{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableVteIntegration = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      if [ -f ~/.zshrc.manual ]; then
        source ~/.zshrc.manual
      fi
    '';
  };

  home.file = {
    ".zshrc.manual".source = ../config/extra-shellrc.sh;
  };
}
