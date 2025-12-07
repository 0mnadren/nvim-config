return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
    -- Ctrl+/ for normal & visual mode
    -- <C-_> is actually Ctrl + /
    vim.keymap.set('n', '<C-_>', function()
      require('Comment.api').toggle.linewise.current()
    end, { noremap = true, silent = true })

    vim.keymap.set('v', '<C-_>', function()
      -- For visual mode we have to use the 'gv' trick
      require('Comment.api').toggle.linewise(vim.fn.visualmode())
    end, { noremap = true, silent = true })
  end,
}
