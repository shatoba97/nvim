return {
  "telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    -- project management
    {
      "ahmedkhalf/project.nvim",
      opts = {
        manual_mode = true,
      },
      event = "VeryLazy",
      config = function(_, opts)
        require("project_nvim").setup(opts)
        require("lazyvim.util").on_load("telescope.nvim", function()
          require("telescope").load_extension("projects")
        end)
      end,
      keys = {
        { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
      },
    },
  },
  keys = function()
    return {
      {
        "<leader>fr",
        "<cmd>Telescope lsp_references show_line=false<CR>",
        mode = { "n" },
        desc = "Show references",
      },
      {
        "gr",
        false,
      },
      {
        "<leader>fd",
        "<cmd>Telescope lsp_definitions<CR>",
        mode = { "n" },
        desc = "Show definitions",
      },
      {
        "<leader>ff",
        "<cmd>Telescope find_files<cr>",
        mode = { "n" },
        desc = "Find files",
      },
      {
        "<leader>fg",
        "<cmd>Telescope grep_string follow=true no_ignore=true hidden=true<cr>",
        mode = { "n", "v" },
        desc = "Find word everyvere",
      },
      {
        "<leader>fw",
        "<cmd>Telescope live_grep<cr>",
        mode = { "n" },
        desc = "Live grep",
      },
      {
        "<leader>fb",
        "<cmd>Telescope buffers<cr>",
        mode = { "n" },
        desc = "Buffers",
      },
      {
        "<leader>fx",
        "<cmd>Telescope quickfix<cr>",
        mode = { "n" },
        desc = "Quickfix",
      },
    }
  end,
  config = function()
    local telescope = require("telescope")

    -- Custom path display function
    local function filenameFirst(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      print(tail, "||", parent)
      if parent == nil then
        return tail
      end
      local t = {}
      for str in string.gmatch(parent, "([^" .. "/" .. "]+)") do
        table.insert(t, str)
      end
      return t[#t] .. "/" .. tail
    end

    -- Apply custom path display to Telescope pickers
    telescope.setup({
      pickers = {
        git_status = {
          path_display = filenameFirst,
        },
        find_files = {
          path_display = filenameFirst,
        },
      },
    })
  end,
}
