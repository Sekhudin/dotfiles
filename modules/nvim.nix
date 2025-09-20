{ config, pkgs, ... }:

{

  programs.neovim = {
    enable = true;
  };

  home.file = {
    ".config/nvim/lua".source = ../config/nvchad/lua;
    ".config/nvim/.styua.toml".source = ../config/nvchad/.stylua.toml;
    ".config/nvim/init.lua".source = ../config/nvchad/init.lua;
  };

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
