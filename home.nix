{ config, pkgs, ... }:

let
  nixglBin = pkgs.nixgl.nixGLMesa;
  nixGLCmd = pkgs.writeShellScriptBin "nixgl" ''
    exec ${nixglBin}/bin/nixGLMesa "$@"
  '';
in
{
  imports = [
    ./modules/desktop.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/oh-my-posh.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  home.username = "syaikhu";
  home.homeDirectory = "/home/syaikhu";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    nixGLCmd
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];

  home.sessionVariables = {

  };

  programs.home-manager.enable = true;
}
