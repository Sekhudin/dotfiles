{ config, pkgs, ... }:

let
  nixglBin = pkgs.nixgl.nixGLMesa;
  nixGLCmd = pkgs.writeShellScriptBin "nixgl" ''
    exec ${nixglBin}/bin/nixGLMesa "$@"
  '';
in
{
  imports = [
    ./modules/android.nix
    ./modules/bash.nix
    ./modules/direnv.nix
    ./modules/fastfetch.nix
    ./modules/git.nix
    ./modules/kitty.nix
    ./modules/nvim.nix
    ./modules/ssh.nix
    ./modules/starship.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
  ];

  home.username = "syaikhu";
  home.homeDirectory = "/home/syaikhu";
  home.stateVersion = "25.05";

  home.packages = [
    nixGLCmd
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.jq
    pkgs.yq
    pkgs.go
    pkgs.fd
    pkgs.fzf
    pkgs.eza
    pkgs.bat
    pkgs.curl
    pkgs.gcc
    pkgs.htop
    pkgs.tree
    pkgs.xclip
    pkgs.gnumake
    pkgs.ripgrep
    pkgs.nodejs_22
    pkgs.python313
    pkgs.nixfmt-rfc-style
  ];

  home.sessionVariables = { };

  home.shellAliases = {
    clipboard = "xclip -selection clipboard";
  };

  home.enableNixpkgsReleaseCheck = false;
  programs.home-manager.enable = true;
}
