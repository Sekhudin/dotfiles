-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local zsh = vim.fn.expand("~/.nix-profile/bin/zsh")
local opt = vim.opt

if vim.fn.filereadable(zsh) == 1 then
  opt.shell = zsh
end

opt.mouse = ""
opt.shellcmdflag = "-c"
opt.shellquote = ""
opt.shellxquote = ""
