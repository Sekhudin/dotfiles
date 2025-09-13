{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "vscode"
  ];

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    profiles.me = {
      userSettings = {
        "editor.tabSize" = 2;
        "files.autoSave" = "afterDelay";
        "editor.fontFamily" = "JetBrains Mono Nerd Font";
        "editor.formatOnSave" = true;

        "[nix]" = {
          "editor.defaultFormatter" = "nixpkgs-fmt";
          "editor.formatOnSave" = true;
        };
      };
      extensions = [
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.biomejs.biome
        pkgs.vscode-extensions.firsttris.vscode-jest-runner
        pkgs.vscode-extensions.meganrogge.template-string-converter
        pkgs.vscode-extensions.ritwickdey.liveserver
        pkgs.vscode-extensions.esbenp.prettier-vscode
        pkgs.vscode-extensions.bradlc.vscode-tailwindcss
        pkgs.vscode-extensions.formulahendry.auto-close-tag
        pkgs.vscode-extensions.formulahendry.auto-rename-tag
        pkgs.vscode-extensions.christian-kohler.npm-intellisense
        pkgs.vscode-extensions.christian-kohler.path-intellisense
        pkgs.vscode-extensions.visualstudioexptteam.vscodeintellicode
      ];
    };

    profiles.work = {
      userSettings = { };
      extensions = [
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.esbenp.prettier-vscode
        pkgs.vscode-extensions.christian-kohler.path-intellisense
        pkgs.vscode-extensions.visualstudioexptteam.vscodeintellicode
      ];
    };
  };

  home.shellAliases = {
    code = "code --no-sandbox";
    "code:me" = "code --profile me --no-sandbox";
    "code:work" = "code --profile work --no-sandbox";
  };
}
