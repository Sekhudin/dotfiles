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
        "workbench.startupEditor" = "none";
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.fontFamily" = "JetbrainsMono Nerd Font";
        "editor.fontLigatures" = true;
        "files.autoSave" = "afterDelay";
        "[nix]" = {
          "editor.defaultFormatter" = "nixpkgs-fmt";
          "editor.formatOnSave" = true;
        };
      };
      extensions = [
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.firsttris.vscode-jest-runner
        pkgs.vscode-extensions.ritwickdey.liveserver
        pkgs.vscode-extensions.esbenp.prettier-vscode
        pkgs.vscode-extensions.bradlc.vscode-tailwindcss
        pkgs.vscode-extensions.formulahendry.auto-close-tag
        pkgs.vscode-extensions.formulahendry.auto-rename-tag
        pkgs.vscode-extensions.christian-kohler.npm-intellisense
        pkgs.vscode-extensions.christian-kohler.path-intellisense
        pkgs.vscode-extensions.meganrogge.template-string-converter
        pkgs.vscode-extensions.visualstudioexptteam.vscodeintellicode
        pkgs.vscode-extensions.catppuccin.catppuccin-vsc-icons
        pkgs.vscode-extensions.catppuccin.catppuccin-vsc
      ];
    };

    profiles.work = {
      userSettings = {
        "workbench.startupEditor" = "none";
        "workbench.colorTheme" = "One Dark Pro Darker";
        "workbench.iconTheme" = "vscode-great-icons";
        "editor.tabSize" = 2;
        "editor.formatOnSave" = true;
        "editor.fontFamily" = "JetbrainsMono Nerd Font";
        "editor.fontLigatures" = true;
        "files.autoSave" = "afterDelay";
        "[nix]" = {
          "editor.defaultFormatter" = "nixpkgs-fmt";
          "editor.formatOnSave" = true;
        };
      };
      extensions = [
        pkgs.vscode-extensions.bbenoist.nix
        pkgs.vscode-extensions.esbenp.prettier-vscode
        pkgs.vscode-extensions.christian-kohler.path-intellisense
        pkgs.vscode-extensions.meganrogge.template-string-converter
        pkgs.vscode-extensions.visualstudioexptteam.vscodeintellicode
        pkgs.vscode-extensions.emmanuelbeziat.vscode-great-icons
        pkgs.vscode-extensions.zhuangtongfa.material-theme
      ];
    };
  };

  home.shellAliases = {
    code = "code --no-sandbox";
    "code:me" = "code --profile me --no-sandbox";
    "code:work" = "code --profile work --no-sandbox";
  };

  xdg.desktopEntries.code = {
    name = "Visual Studio Code";
    genericName = "Text Editor";
    comment = "Code Editing. Redefined.";
    exec = "code --no-sandbox %F";
    icon = "vscode";
    terminal = false;
    type = "Application";
    categories = [ "Utility" "TextEditor" "Development" "IDE" ];
    startupNotify = true;
    settings = {
      Keywords = "code;vscode;editor";
    };
    actions = {
      new-empty-window = {
        name = "New Empty Window";
        exec = "code --no-sandbox --new-window %F";
        icon = "vscode";
      };
    };
  };

  xdg.desktopEntries.code-url-handler = {
    name = "Visual Studio Code - URL Handler";
    genericName = "Text Editor";
    comment = "Code Editing. Redefined.";
    exec = "code --no-sandbox --open-url %U";
    icon = "vscode";
    terminal = false;
    type = "Application";
    categories = [ "Utility" "TextEditor" "Development" "IDE" ];
    startupNotify = true;
    mimeType = [ "x-scheme-handler/vscode" ];
    noDisplay = true;
  };
}
