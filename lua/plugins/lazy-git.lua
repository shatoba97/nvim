return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  config = function()
    require("lazy").setup({
    {
        "kdheepak/lazygit.nvim",
    	cmd = {
    		"LazyGit",
    		"LazyGitConfig",
    		"LazyGitCurrentFile",
    		"LazyGitFilter",
    		"LazyGitFilterCurrentFile",
    	},
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    })
  end,
}
