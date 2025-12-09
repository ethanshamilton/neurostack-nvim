-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- override K to show hover with a border
map("n", "K", function()
  vim.lsp.buf.hover({
    border = "rounded", -- "single", "double", "solid", etc also valid
  })
end, { desc = "LSP Hover (bordered)" })
