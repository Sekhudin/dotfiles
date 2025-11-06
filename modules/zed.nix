{ config, pkgs, ... }:

{
  programs.zed-editor = {
    enable = false;
    extensions = [
      "html"
      "javascript"
      "typescript"
      "nix"
      "biome"
    ];
  };
}