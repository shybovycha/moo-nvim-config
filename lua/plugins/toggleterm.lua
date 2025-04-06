return {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function ()
    require('toggleterm').setup({
      hide_numbers = true,
    })

    vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', { desc = 'Open terminal' })
  end,
}
