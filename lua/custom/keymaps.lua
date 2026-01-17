-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<C-v>', '<C-v>', { noremap = true })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- ─────────────────────────────────────────────────────────────
-- Open netrw (file explorer) with <leader>pv
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- ─────────────────────────────────────────────────────────────
-- MOVE highlighted lines up and down in visual mode
-- Rearrange blocks of code/text using J/K in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- Move selection down
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv") -- Move selection up

-- ─────────────────────────────────────────────────────────────
-- LINE JOINING AND YANKING BEHAVIOR
-- 'J': Join lines without moving the cursor
-- 'Y': Yank from cursor to end of line (like 'D' or 'C')
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', 'Y', 'yg$')

-- ─────────────────────────────────────────────────────────────
-- BETTER SCROLLING EXPERIENCE
-- Keep cursor centered when scrolling
vim.keymap.set('n', '<C-u>', '<C-u>zz') -- Scroll up and center
vim.keymap.set('n', '<C-d>', '<C-d>zz') -- Scroll down and center

-- ─────────────────────────────────────────────────────────────
-- CENTERED SEARCH RESULTS
-- Keep the match in the center when navigating with `n` or `N`
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- ─────────────────────────────────────────────────────────────
-- PASTE OVER SELECTION WITHOUT OVERWRITING REGISTER
vim.keymap.set('x', '<leader>p', "'_dP")

-- ─────────────────────────────────────────────────────────────
-- YANK TO SYSTEM CLIPBOARD
-- Use `"+` to yank directly to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')

-- ─────────────────────────────────────────────────────────────
-- DELETE WITHOUT YANKING
-- Uses the "black hole" register to avoid overwriting default yank
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- ─────────────────────────────────────────────────────────────
-- INSERT MODE SHORTCUTS
-- <C-c> acts like <Esc>
vim.keymap.set('i', '<C-c>', '<Esc>')

-- ─────────────────────────────────────────────────────────────
-- MISC / UTILITY MAPPINGS

-- Disable annoying Ex mode when accidentally hitting Q
vim.keymap.set('n', 'Q', '<nop>')

-- Run a tmux command to open session switcher (Primagen-specific)
vim.keymap.set('n', '<C-t>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Format current buffer using LSP (Language Server Protocol)
vim.keymap.set('n', '<leader>f', function()
  vim.lsp.buf.format()
end)

-- ─────────────────────────────────────────────────────────────
-- QUICKFIX AND LOCATION LIST NAVIGATION
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz') -- Next quickfix item
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz') -- Previous quickfix item
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz') -- Next location list item
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz') -- Previous location list item

-- ─────────────────────────────────────────────────────────────
-- SUBSTITUTE CURRENT WORD (Refactor-style)
-- Replace all instances of the word und
vim.keymap.set('n', '<leader>s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left>')

-- Smart dd (Avoid Yank if Line is Empty)
vim.keymap.set('n', 'dd', function()
  return vim.fn.getline '.' == '' and '"_dd' or 'dd'
end, { expr = true, desc = "Smart dd: don't yank empty lines" })

-- Stay in visual mode after indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Create undo breakpoints for common punctuation
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '!', '!<c-g>u')
vim.keymap.set('i', '?', '?<c-g>u')

-- Move between buffers (open files)
vim.keymap.set('n', '[b', '<cmd>bprevious<CR>', { desc = 'Go to previous buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', { desc = 'Go to next buffer' })
