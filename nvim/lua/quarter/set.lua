 -- vim.opt.guicursor = ""

 vim.opt.nu = true
 vim.opt.relativenumber = true

 vim.opt.errorbells = false

 vim.opt.tabstop = 2
 vim.opt.softtabstop = 2
 vim.opt.shiftwidth = 2
 vim.opt.expandtab = true

 vim.opt.smartindent = true
 vim.opt.autoindent = true

 vim.opt.wrap = false

 vim.opt.swapfile = false
 vim.opt.backup = false
 vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
 vim.opt.undofile = true

 vim.opt.hlsearch = false
 vim.opt.incsearch = true

 vim.opt.termguicolors = true

 vim.opt.scrolloff = 8
 vim.opt.signcolumn = "yes"
 vim.opt.isfname:append("@-@")

 -- Give more space for displaying messages.
 -- vim.opt.cmdheight = 1

 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
 -- delays and poor user experience.
 vim.opt.updatetime = 50
 vim.opt.cmdheight = 1

 -- Don't pass messages to |ins-completion-menu|.
 vim.opt.shortmess:append("c")

 vim.opt.colorcolumn = "88"


 -- space is the leader
 vim.g.mapleader = " "


 -- set cursorline
 vim.opt.cursorline = true


 vim.opt.fixendofline = true
 vim.opt.linespace = 10

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
