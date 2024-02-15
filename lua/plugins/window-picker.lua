return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  version = "2.*",
  event = "VeryLazy",
  config = function()
    require("window-picker").setup({
      hint = "floating-big-letter",
      highlights = {
        statusline = {
          focused = {
            fg = "#ededed",
            bg = "#e35e4f",
            bold = true,
          },
          unfocused = {
            fg = "#ededed",
            bg = "#447c41",
            bold = true,
          },
        },
        winbar = {
          focused = {
            fg = "#ededed",
            bg = "#e35e4f",
            bold = true,
          },
          unfocused = {
            fg = "#ededed",
            bg = "#447c41",
            bold = true,
          },
        },
      },
    })
  end,
}
