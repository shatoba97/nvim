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
}
