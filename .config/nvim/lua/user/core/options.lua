local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.wildmode = 'longest:full,full' -- complete the longest common match, and allow tabbing the results to fully complete them
opt.completeopt = 'menuone,longest,preview'
opt.spell = true

opt.title = true
opt.mouse = 'a' -- enable mouse for all modes

opt.list = true -- enable the below listchars
opt.listchars = { tab = '▸ ', trail = '·' }
opt.fillchars:append({ eob = ' ' }) -- remove the ~ from end of buffer
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.confirm = true -- ask for confirmation instead of erroring

opt.signcolumn = 'yes:2'

opt.undofile = true -- persistent undo
opt.backup = true -- automatically save a backup file
opt.backupdir:remove('.') -- keep backups out of the current directory

opt.iskeyword:append("-") -- consider string-string as whole word
