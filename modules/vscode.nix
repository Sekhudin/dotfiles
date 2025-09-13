{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
  ];

  programs.vscode = {
     enable = true;
     mutableExtensionsDir = false;
     profiles.default = {
       extensions = [
         pkgs.vscode-extensions.esbenp.prettier-vscode
       ];
     };

     profiles.me = {
       extensions = [
         pkgs.vscode-extensions.esbenp.prettier-vscode
       ];
     };

     profiles.work = {
       extensions = [
       ];
     };
  };

  home.shellAliases = {
    code = "code --no-sandbox";
    "code:me" = "code --profile me --no-sandbox";
    "code:work" = "code --profile work --no-sandbox";
  };
}
