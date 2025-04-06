return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- {'3rd/image.nvim', opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  config = function()
    require('neo-tree').setup({
      close_if_last_window = true, -- if NeoTree is the last window, quit NeoVim
      filesystem = {
        follow_current_file = {
          enabled = true, -- highlight currently open file in NeoTree
          leave_dirs_open = true, -- expand the directories leading to the current file
        },
        filtered_items = {
          hide_hidden = false, -- show hidden files in Windows
          hide_dotfiles = false, -- show dot files and dirs
          hide_gitignored = false, -- show files ignored by Git
        },
      },
    })

    -- vim.cmd(':Neotree reveal left') -- open NeoTree with NeoVim

    vim.keymap.set('n', '<leader>n', ':Neotree filesystem toggle left<CR>', { desc = 'Neotree' }) -- C-n toggles NeoTree
  end,
}

