-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 2 -- global statusline
opt.number = true -- Print line number
opt.relativenumber = true -- Relative line numbers

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util'.ui.statuscolumn()]]
end

vim.o.formatexpr = "v:lua.require'lazyvim.util'.format.formatexpr()"
vim.opt.spelllang = "en_us"
vim.opt.spell = true
-- Folding
vim.opt.foldlevel = 99
vim.opt.foldmethod = "indent"
