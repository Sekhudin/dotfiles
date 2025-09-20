{ config, pkgs, ... }:

let
  nixglBin = pkgs.nixgl.nixGLMesa;
  nixGLCmd = pkgs.writeShellScriptBin "nixgl" ''
    exec ${nixglBin}/bin/nixGLMesa "$@"
  '';
in
{
  imports = [
    ./modules/bash.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/nvim.nix
    ./modules/oh-my-posh.nix
    ./modules/ssh.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/vscode.nix
    ./modules/zsh.nix
  ];

  home.username = "syaikhu";
  home.homeDirectory = "/home/syaikhu";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    nixGLCmd
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    pkgs.gcc
    pkgs.htop
    pkgs.tree
    pkgs.xclip
    pkgs.gnumake
    pkgs.ripgrep
    pkgs.nixpkgs-fmt
  ];

  home.sessionVariables = { 

  };

  home.shellAliases = {
    clipboard = "xclip -selection clipboard";
  };

  programs.home-manager.enable = true;
}
