return {
  {
    "rktjmp/lush.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("lush")(require("lush_theme.neurostack"))
      end,
    },
  },
}
