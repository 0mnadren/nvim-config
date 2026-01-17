return
-- See `:help gitsigns` to understand what the configuration keys do
{
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged = {
      add = { text = '┃' },
      change = { text = '┃' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '┆' },
    },
    signs_staged_enable = true,
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true,
    },
    auto_attach = true,
    attach_to_untracked = false,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
      use_focus = true,
    },
    current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1,
    },
  },
  config = function(_, opts)
    require('gitsigns').setup(opts)

    -- Keymaps for toggles
    vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<CR>', { desc = 'Toggle Git Blame' })
    vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<CR>', { desc = 'Git [D]iff Side-by-Side' })
    vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status, { desc = 'Git [S]tatus List' })
    --    vim.keymap.set('n', '<leader>gs', '<cmd>Gitsigns toggle_signs<CR>', { desc = 'Toggle Git Signs' })
    --    vim.keymap.set('n', '<leader>gw', '<cmd>Gitsigns toggle_word_diff<CR>', { desc = 'Toggle Word Diff' })
  end,
}
