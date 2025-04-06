return {
  -- symbol outline (methods, classes, functions, etc.) in the current file, provided by LSP
  'hedyhli/outline.nvim',
  event = 'VeryLazy',
  dependencies = { 'epheien/outline-treesitter-provider.nvim', },
  config = function()
    require('outline').setup({
      providers = {
        priority = { 'lsp', 'coc', 'markdown', 'treesitter' },
      },
    })

    vim.keymap.set('n', '<leader>o', '<cmd>Outline<CR>', { desc = 'Show outline' })
  end,
}

