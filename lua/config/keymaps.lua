-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<C-a>", "gg<S-v>G")

keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<Tab>", ":bnext<Return>", opts)
keymap.set("n", "<S-Tab>", ":bprev<Return>", opts)

keymap.set("n", "<C-Tab>", ":tabnext<Return>", opts)

keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "NeoTree focuse" })

keymap.set("n", "<leader>wa", "<cmd>wa<cr>", { desc = "Save all Files" })
keymap.set("n", "<leader>wf", "<cmd>w<cr>", { desc = "Save File" })

keymap.set("n", "<leader>qc", "<cmd>confirm q<cr>", { desc = "Quit", silent = true, noremap = true })

keymap.set("n", "<leader>n", "<cmd>enew<cr>", { desc = "New File" })

keymap.set("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
keymap.set("n", "<C-q>", "<cmd>qa!<cr>", { desc = "Force quit" })

keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
keymap.set("n", "-", "<cmd>split<cr>", { desc = "Horizontal Split" })
