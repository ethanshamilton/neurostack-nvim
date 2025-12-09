-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- DISABLE SPELL CHECKING
local group = vim.api.nvim_create_augroup("my_no_spell", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "markdown", "text", "gitcommit" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

-- CUSTOM FILE TYPES
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hx",
  callback = function()
    vim.bo.filetype = "rust"
  end,
})
