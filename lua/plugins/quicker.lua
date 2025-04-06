return {
  'stevearc/quicker.nvim',
  event = "FileType qf",
  config = function()
    vim.keymap.set("n", "<leader>q", require("quicker").toggle, { desc = "Toggle quickfix", })
    vim.keymap.set("n", "<leader>l", function() require("quicker").toggle({ loclist = true }) end, { desc = "Toggle loclist", })
  end,
}

