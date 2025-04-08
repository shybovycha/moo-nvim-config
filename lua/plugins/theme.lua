-- return {
--   'catppuccin/nvim',
--   name = 'catppuccin',
--   priority = 1000,
--   config = function()
-- 
--    vim.cmd.colorscheme('catppuccin')
--   end,
-- }

-- else
--   print('mode' .. color_mode)
-- 
   return {
     'rebelot/kanagawa.nvim',
     name = 'kanagawa',
     priority = 1000,
     config = function()
       require('kanagawa').setup({
         theme = 'wave', -- dragon, lotus, wave
         -- background = {
         --   dark = 'wave',
         --   light = 'lotus',
         -- },
       })
     end,
   }
-- end
-- 
