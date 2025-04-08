return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module='...'` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    -- 'rcarriga/nvim-notify',
  },
  -- opts = {
  --   lsp = {
  --     override = {
  --       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --       ["vim.lsp.util.stylize_markdown"] = true,
  --       ["cmp.entry.get_documentation"] = true,
  --     },
  --   },
  --   routes = {
  --     {
  --       filter = {
  --         event = "msg_show",
  --         any = {
  --           { find = "%d+L, %d+B" },
  --           { find = "; after #%d+" },
  --           { find = "; before #%d+" },
  --         },
  --       },
  --       view = "mini",
  --     },
  --   },
  --   presets = {
  --     -- bottom_search = true,
  --     command_palette = true,
  --     long_message_to_split = true,
  --   },
  -- },
  config = function()
    require('noice').setup({})

    -- Map arrow keys for wildmenu completion
    vim.api.nvim_set_keymap('c', '<Down>', 'v:lua.get_wildmenu_key("<right>", "<down>")', { expr = true })
    vim.api.nvim_set_keymap('c', '<Up>', 'v:lua.get_wildmenu_key("<left>", "<up>")', { expr = true })

    function _G.get_wildmenu_key(key_wildmenu, key_regular)
      return vim.fn.wildmenumode() ~= 0 and key_wildmenu or key_regular
    end
  end,
}
