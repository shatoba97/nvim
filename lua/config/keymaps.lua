-- add yours here
-- Function to hide all buffers except for the current buffer

local wk = require("which-key")
local map = vim.keymap.set

map("n", "<C-a>", "gg<S-v>G")

-- map("n", "te", "tabedit", opts)
-- map("n", "<S-Tab>", ":tabprevious<Return>", opts)
-- map("n", "<Tab>", ":tabnext<Return>", opts)
wk.register({
  t = {
    name = "Tab",
    t = { ":tabnew<Enter>", "New Tab" },
    c = { ":tabclose<Return>", "Close Tab" },
    n = { ":tabnext<Return>", "Next Tab" },
    p = { ":tabprevious<Return>", "Previous Tab" },
    u = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },
  },
  c = {
    name = "Code",
    f = {
      function()
        vim.lsp.buf.format({
          async = false,
        })
      end,
      "Format buffer",
    },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Diagnostics" },
    ["m"] = "which_key_ignore",
    p = {
      function()
        local id = require("window-picker").pick_window()
        if id then
          vim.api.nvim_set_current_win(id)
        end
      end,
      "Pick window",
      noremap = true,
      silent = false,
    },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document symbols" },
    o = {
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.organizeImports.ts" },
            diagnostics = {},
          },
        })
      end,
      "Organize Imports",
    },
    R = {
      function()
        vim.lsp.buf.code_action({
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
            diagnostics = {},
          },
        })
      end,
      "Remove Unused Imports",
    },
    a = {
      function()
        vim.lsp.buf.code_action()
      end,
      "Code actions",
    },
    r = {
      function()
        vim.lsp.buf.rename()
      end,
      "Rename field",
    },
  },
  g = {
    name = "Lazy git",
    g = { "<cmd>LazyGit<cr>", "Git" },
    f = { "<cmd>LazyGitCurrentFile<cr>", "Show changes by current file" },
    ["d"] = "which_key_ignore",
    ["t"] = "which_key_ignore",
  },
  q = {
    name = "Quit",
    q = { "<cmd>qa!<cr>", "Force quit" },
    c = { "<cmd>confirm q<cr>", "Close split buffer(buffer save)" },
    s = { "<cmd>only<cr>", "Close all other splits" },
    C = { ":bd<cr>", "Close buffer" },
  },
  w = {
    name = "Save",
    a = { "<cmd>wa<cr>", "Save all files" },
    f = { "<cmd>w<cr>", "Save current file" },
    ["l"] = "which_key_ignore",
    ["r"] = "which_key_ignore",
  },
  f = {
    name = "Find",
  },
  s = {
    name = "Session",
    s = { ":SessionsSave<cr>", "Save Session", silent = true },
    l = { ":SessionsLoad<cr>", "Load Session", silent = true },
  },
}, { prefix = "<leader>" })

map("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "NeoTree toggle", noremap = true, silent = true })
map("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "NeoTree focus", noremap = true, silent = true })

map("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
map("n", "-", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Navigation
map({ "n", "v" }, "<Tab>", ":tabnext<cr>", { desc = "Next Tab", silent = true })
map({ "n", "v" }, "<S-Tab>", ":tabprevious<cr>", { desc = "Previous Tab", silent = true })

-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })
map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })
map("t", "<ESC>q", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })
