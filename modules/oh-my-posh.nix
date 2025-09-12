{ config, pkgs, ... }:

{
  programs.oh-my-posh = {
    enable = false;
    enableBashIntegration = true;
    enableZshIntegration = true;
    useTheme = "amro";
  };
}
