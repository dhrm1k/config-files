-- i don't use it. i prefer vimscript. this is a big just in case.

print(">^.^<")


vim.opt.number = true


vim.opt.autoindent = true

vim.api.nvim_command('syntax match VimwikiConceal /^{{{.*\\|^}}}.*/ conceal')
vim.api.nvim_set_hl(0, 'VimwikiConceal', { link = 'Conceal' })


vim.opt.mouse = "i"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4


vim.opt.wrap = true
vim.opt.linebreak = true

vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true, silent = true })

--Exit the terminal buffer.
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.keymap.set('t', 'kj', '<C-\\><C-n>', { noremap = true, silent = true })

-- VimWiki keybindings

-- VimWiki settings
vim.g.vimwiki_diary_rel_path = "diary"
vim.g.vimwiki_auto_diary_index = 1

-- Key mappings for VimWiki diary features
vim.api.nvim_set_keymap("n", "<Leader>dt", ":VimwikiMakeDiaryNote<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dy", ":VimwikiDiaryPrevDay<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>dm", ":VimwikiDiaryNextDay<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>di", ":VimwikiDiaryIndex<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<Leader>gf", ":VimwikiRebuildIndex<CR>", { noremap = true, silent = true })



-- Map Ctrl-S to save the file in different modes
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-s>", "<Esc>:w<CR>", { noremap = true, silent = true })


--To exit terminal mode


-- Plugins
--
vim.cmd [[
  call plug#begin()

  Plug 'preservim/nerdtree'        " File tree
  Plug 'vim-airline/vim-airline'    " Status bar
  Plug 'tpope/vim-surround'         " Surrounding ysw
  Plug 'ryanoasis/vim-devicons'     " Developer Icons
  Plug 'ap/vim-css-color'           " CSS Color Preview
  Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
  Plug 'neoclide/coc.nvim'          " Auto Completion
  Plug 'vimwiki/vimwiki'           " Vimwiki

  call plug#end()
]]

-- General Settings
vim.opt.compatible = false
vim.cmd('filetype plugin on')
vim.cmd('syntax on')

-- NERDTree Mappings
vim.api.nvim_set_keymap("n", "<C-f>", ":NERDTreeFocus<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-n>", ":NERDTree<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

-- NERDTree Window Size
vim.g.NERDTreeWinSize = 20

-- YouCompleteMe settings
vim.g.ycm_auto_trigger = 1
vim.g.ycm_goto_previous_completion = '<C-p>'
vim.g.ycm_goto_next_completion = '<C-n>'

-- Coc.nvim settings
vim.g.coc_disable_startup_warning = 1

-- Colorscheme
vim.cmd("colorscheme gruvbox")

-- Tab Completion for Coc
vim.api.nvim_set_keymap("i", "<Tab>", "pumvisible() ? coc#_select_confirm() : \"<C-g>u<Tab>\"", { noremap = true, silent = true, expr = true })

--popups for language
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true })

-- vim wiki html generation --
vim.g.vimwiki_list = {
  {
	-- when want to generate html then below
     path = "~/vimwiki/webwiki/",
	-- regular diary below
--	path = "~/vimwiki",


	syntax = "default",
    ext = ".wiki",
    path_html = "~/from-my-github/dhrm1k.github.io/vimwiki_html/"
  }
}

vim.g.vimwiki_html_header = "~/vimwiki/header.html"
vim.g.vimwiki_html_footer = "~/vimwiki/footer.html"
-- Keybinding to run Python code with F9
vim.api.nvim_set_keymap('n', '<F9>', ':w !python3 %<CR>', { noremap = true, silent = true })


-- Resize windows using Ctrl + Arrow keys
vim.keymap.set('n', '<C-Left>',  ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Up>',    ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>',  ':resize -2<CR>', { noremap = true, silent = true })

