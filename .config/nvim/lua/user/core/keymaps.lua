-- Space is my leader.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- When text is wrapped, move by terminal rows, not lines, unless a count is provided.
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- Reselect visual selection after indenting.
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Maintain the cursor position when yanking a visual selection.
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
keymap.set('v', 'y', 'myy`y')

-- Disable annoying command line typo.
keymap.set('n', 'q:', ':q')

-- Paste replace visual selection without copying it.
keymap.set('v', 'p', '"_dP')

-- Easy insertion of a trailing ; or , from insert mode.
keymap.set('i', ';;', '<Esc>A;')
keymap.set('i', ',,', '<Esc>A,')

-- Quickly clear search highlighting.
keymap.set('n', '<Leader>k', ':nohlsearch<CR>')

-- Open the current file in the default program (on Linux this should be `xdg-open`).
keymap.set('n', '<Leader>x', ':!open %<CR><CR>')

-- Move lines up and down.
keymap.set('i', '<A-j>', '<Esc>:move .+1<CR>==gi')
keymap.set('i', '<A-k>', '<Esc>:move .-2<CR>==gi')
keymap.set('n', '<A-j>', ':move .+1<CR>==')
keymap.set('n', '<A-k>', ':move .-2<CR>==')
keymap.set('v', '<A-j>', ":move '>+1<CR>gv=gv")
keymap.set('v', '<A-k>', ":move '<-2<CR>gv=gv")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<Leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<Leader>+", "<C-a>") -- increment
keymap.set("n", "<Leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<Leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<Leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<Leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<Leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<Leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<Leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<Leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<Leader>tp", ":tabp<CR>") --  go to previous tab
