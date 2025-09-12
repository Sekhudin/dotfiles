{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zsh
    oh-my-posh
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      if [ -f ~/.zshrc.manual ]; then
        source ~/.zshrc.manual
      fi

      eval "$(oh-my-posh init zsh --config ~/.theme.omp.json)"
    '';
  };

  home.file = {
    ".zshrc.manual".source = ../config/zsh/.zshrc.manual;
    ".theme.omp.json".source = ../config/omp/amro.omp.json;
  };
}

