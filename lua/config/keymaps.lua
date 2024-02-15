-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<S-Tab>", ":tabprevious<Return>", opts)
keymap.set("n", "<Tab>", ":tabnext<Return>", opts)

keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "NeoTree focuse" })

keymap.set("n", "<leader>wa", "<cmd>wa<cr>", { desc = "Save all Files" })
keymap.set("n", "<leader>wf", "<cmd>w<cr>", { desc = "Save File" })

keymap.set("n", "<leader>n", "<cmd>enew<cr>", { desc = "New File" })

keymap.set("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Force quit" })

keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
keymap.set("n", "-", "<cmd>split<cr>", { desc = "Horizontal Split" })

keymap.set("n", "<leader>qC", "<cmd>confirm q<cr>", { desc = "Quit", silent = true, noremap = true })
keymap.set("n", "<leader>qc", "<cmd>close<cr>", { desc = "Close split" })
keymap.set("n", "<leader>qS", "<cmd>only<cr>", { desc = "Close all other splits" })

keymap.set("n", "<leader>qc", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buff" })
keymap.set("n", "<leader>cj", ":call GotoJump()<cr>", { noremap = true, silent = true, desc = "Jumps" })
keymap.set("n", "<leader>cp", function()
  local id = require("window-picker").pick_window()
  if id then
    vim.api.nvim_set_current_win(id)
  end
end, { noremap = true, desc = "Pick window", silent = false })
