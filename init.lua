vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.scrolloff = 10
vim.opt.cursorline = true

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Esc in normal mode would remove search highlights
-- vim.keymap.set('i', 'jj', '<Esc>') -- jj in insert mode would exit insert mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-Left>', '<C-o>', { desc = 'Go back (jumplist)' })
vim.keymap.set('n', '<C-Right>', '<C-i>', { desc = 'Go forward (jumplist)' })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
--
require("lazy").setup({
  spec = "plugins",
  checker = { enabled = true },
})

-- Terminal
--
-- vim.api.nvim_create_autocmd('TermOpen', {
--   group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
--   callback = function ()
--     vim.opt.number = false -- do not show line numbers in terminal
--     vim.opt.relativenumber = false -- do not show relative line numbers in terminal
--   end,
-- })
-- 
-- vim.keymap.set('n', '<leader>t', function ()
--     vim.cmd.vnew() -- new panel
--     vim.cmd.term() -- open terminal in the new panel
--     vim.cmd.wincmd("J") -- put panel with terminal at the bottom
--     vim.api.nvim_win_set_height(0, 15) -- set panel height
--   end,
--   { desc = 'Open terminal' }
-- )

-- Window navigation
-- 
-- vim.keymap.set('n', '<leader>w', '

-- lualine statusline
-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup({
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center components here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
})

vim.schedule(function ()
  vim.cmd.colorscheme('kanagawa-wave')
  vim.api.nvim_set_option('background', 'dark')
end)
