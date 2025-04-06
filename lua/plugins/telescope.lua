return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')
      local builtin = require('telescope.builtin')

      local telescope_config = require('telescope.config')

      -- clone default Telescope config
      local vimgrep_arguments = { unpack(telescope_config.values.vimgrep_arguments) }

      -- allow searching in hidden files
      table.insert(vimgrep_arguments, '--hidden')

      -- except .git/
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/.git/*')

      telescope.setup({
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--hidden', '--glob', '!**/.git/*' },
          },
        },
      })

      vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope find Git files' })
      vim.keymap.set('n', '<leader>w', function() builtin.grep_string({ search = vim.fn.expand('<cword>') }) end, { desc = 'Telescope find Git files' })
      vim.keymap.set('n', '<leader><leader>', builtin.builtin, { desc = 'Telescope builtin' })
      vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>b', function() builtin.buffers({ sort_lastused = true, ignore_current_buffer = true }) end, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>?', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Telescope references' })
      vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Telescope definitions' })
      vim.keymap.set('n', 'gI', builtin.lsp_implementations, { desc = 'Telescope definitions' })
    end
  },
--   {
--     'nvim-telescope/telescope-file-browser.nvim',
--     dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
--     config = function()
--       local telescope = require('telescope')
-- 
--       telescope.load_extension 'file_browser'
-- 
--       -- show files and search input on top of the panel
--       telescope.setup({
--         defaults = {
--           sorting_strategy = 'ascending',
--           layout_config = {
--             horizontal = {
--               prompt_position = 'top',
--             },
--           },
--         },
--       })
-- 
--       -- vim.keymap.set('n', '<leader>ff', telescope.extensions.file_browser.file_browser, { desc = 'Telescope file browser' })
--     end
--   },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      local telescope = require('telescope')

      telescope.load_extension('ui-select')

      telescope.setup({
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({})
          },
        },
      })
    end,
  },
  -- {
  --   'jonarrien/telescope-cmdline.nvim',
  --   dependencies = { 'nvim-telescope/telescope.nvim' },
  --   config = function()
  --     local telescope = require('telescope')
  --
  --     telescope.load_extension('cmdline')
  --
  --     vim.keymap.set('n', '<leader>q', '<cmd>Telescope cmdline<CR>', { desc = 'Telescope cmdline' })
  --   end,
  -- },
}
