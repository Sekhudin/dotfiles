{ config, pkgs, lib, ... }:


let
  nvimFlavor = "lazyvim";
in
{

  programs.neovim = {
    enable = true;
  };

  home.file =
    if nvimFlavor == "nvchad" then {
      ".config/nvim/lua".source = ../config/nvchad/lua;
      ".config/nvim/init.lua".source = ../config/nvchad/init.lua;
      ".config/nvim/stylua.toml".source = ../config/nvchad/stylua.toml;
    } else if nvimFlavor == "lazyvim" then {
      ".config/nvim/lua".source = ../config/nvim/lua;
      ".config/nvim/.neoconf.json".source = ../config/nvim/.neoconf.json;
      ".config/nvim/init.lua".source = ../config/nvim/init.lua;
      ".config/nvim/stylua.toml".source = ../config/nvim/stylua.toml;
    } else { };

  xdg.desktopEntries.nvim = {
    name = "Neovim";
    genericName = "Text Editor";
    comment = "Edit text files";
    exec = "nixgl kitty --class nvim --detach nvim %F";
    terminal = true;
    type = "Application";
    icon = "nvim";
    categories = [ "Utility" "TextEditor" ];
    startupNotify = false;
    settings = {
      StartupWMClass = "nvim";
      Keywords = "nvim;vim;editor";
    };
    mimeType = [
      "text/english"
      "text/plain"
      "text/x-makefile"
      "text/x-c++hdr"
      "text/x-c++src"
      "text/x-chdr"
      "text/x-csrc"
      "text/x-java"
      "text/x-moc"
      "text/x-pascal"
      "text/x-tcl"
      "text/x-tex"
      "application/x-shellscript"
      "text/x-c"
      "text/x-c++"
    ];
  };
}
