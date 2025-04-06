return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({})
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'bashls', 'clangd', 'cmake', 'cssls', 'serve_d', 'dockerls', 'groovyls', 'jdtls', 'jsonls', 'marksman', 'glsl_analyzer', 'sqls', 'ts_ls', 'yamlls' },
      })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.cmake.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })
      lspconfig.dockerls.setup({ capabilities = capabilities })
      lspconfig.groovyls.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ settings = { signatureHelp = { enabled = true } }, capabilities = capabilities })
      lspconfig.jsonls.setup({ capabilities = capabilities })
      lspconfig.marksman.setup({ capabilities = capabilities })
      lspconfig.glsl_analyzer.setup({ capabilities = capabilities })
      lspconfig.sqls.setup({ capabilities = capabilities })
      lspconfig.serve_d.setup({ capabilities = capabilities })
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.yamlls.setup({ capabilities = capabilities })

      -- show hint for the symbol under cursor
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

      -- show code actions on <leader>ca
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})

      -- in <leader>fr (find LSP references) menu, pressing <C-q> will send the search results to a quickbuffer
      -- then, <[c> to go to previous search result and <]c> to go to the next search result
      vim.keymap.set('n', '[c', '<cmd>cprev<CR>', { desc = 'Go to previous quickbuffer entry' })
      vim.keymap.set('n', ']c', '<cmd>cnext<CR>', { desc = 'Go to next quickbuffer entry' })
    end,
  },
}
