{ config, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extentions = [
      "html"
      "javascript"
      "typescript"
      "nix"
      "biome"
    ];
  }
}