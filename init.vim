" Welcome message
echo ">^.^<"

" Basic settings
set number
set autoindent
set mouse=i
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set wrap
set linebreak
set nocompatible
filetype plugin indent on
syntax on

" Vimwiki conceal syntax
syntax match VimwikiConceal /^{{{.*\|^}}}.*/ conceal
highlight link VimwikiConceal Conceal

" Terminal mode escape mappings
tnoremap <Esc> <C-\><C-n>
tnoremap kj <C-\><C-n>

" Insert mode quick escape
inoremap jj <Esc>

" Save file with Ctrl+S in all modes
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>

" NERDTree Mappings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeWinSize = 20

" coc.nvim settings
let g:coc_disable_startup_warning = 1

" Tab completion for coc.nvim
inoremap <silent><expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

" Run Python file with F9
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Resize windows with Ctrl + arrow keys
nnoremap <C-Left> :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>
nnoremap <C-Up> :resize +2<CR>
nnoremap <C-Down> :resize -2<CR>

" VimWiki Diary Mappings
let g:vimwiki_diary_rel_path = 'diary'
let g:vimwiki_auto_diary_index = 1

nnoremap <Leader>dt :VimwikiMakeDiaryNote<CR>
nnoremap <Leader>dy :VimwikiDiaryPrevDay<CR>
nnoremap <Leader>dm :VimwikiDiaryNextDay<CR>
nnoremap <Leader>di :VimwikiDiaryIndex<CR>
nnoremap <Leader>gf :VimwikiRebuildIndex<CR>

" VimWiki configuration
"
" HTML-generating Wiki: Uncomment this block to enable HTML generation
let g:vimwiki_list = [{
    \ 'path': '~/vimwiki/webwiki/',
    \ 'syntax': 'default',
    \ 'ext': '.wiki',
    \ 'path_html': '~/from-my-github/dhrm1k.github.io/vimwiki_html/'
    \ }]

" Regular diary: Uncomment this block to enable the simple diary version
" let g:vimwiki_list = [{
"     \ 'path': '~/vimwiki/',
"     \ 'syntax': 'default',
"     \ 'ext': '.wiki',
"     \ 'path_html': '~/from-my-github/dhrm1k.github.io/vimwiki_html/'
"     \ }]

" TOGGLE HELP:
" Uncomment one block at a time.  
" To remove comments quickly, in normal mode:
" - Select the lines (Shift + V then move up/down)  
" - Type: :s/^"\s\?// to uncomment lines  
" - To comment, select and type: :s/^/"/  
"

" VimWiki HTML headers/footers
let g:vimwiki_html_header = '~/vimwiki/header.html'
let g:vimwiki_html_footer = '~/vimwiki/footer.html'


" Plugins
call plug#begin()
Plug 'preservim/nerdtree'            " File tree
Plug 'vim-airline/vim-airline'       " Status bar
Plug 'tpope/vim-surround'            " Surrounding ysw
Plug 'ryanoasis/vim-devicons'        " Developer Icons
Plug 'ap/vim-css-color'              " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro Scheme
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto Completion
Plug 'vimwiki/vimwiki'               " VimWiki
Plug 'sbdchd/neoformat'              " Code formatting
Plug 'github/copilot.vim'            " GitHub Copilot for Vim
Plug 'goolord/alpha-nvim'		 " Dashboard	
call plug#end()

" Colorscheme
colorscheme gruvbox

" Transparent background
hi Normal guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE




lua << EOF
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- ASCII Art Header
dashboard.section.header.val = {
[[  _   _ _____  ______ _   _   ___  _________  ________ _   __]],
[[| | | |_   _| |  _  \ | | | / _ \ | ___ \  \/  |_   _| | / / ]],
[[| |_| | | |   | | | | |_| |/ /_\ \| |_/ / .  . | | | | |/ /  ]],
[[|  _  | | |   | | | |  _  ||  _  ||    /| |\/| | | | |    \  ]],
[[| | | |_| |_  | |/ /| | | || | | || |\ \| |  | |_| |_| |\  \ ]],
[[\_| |_/\___/  |___/ \_| |_/\_| |_/\_| \_\_|  |_/\___/\_| \_/ ]],
[[]],                                                            
                                                                                            

	}

-- Menu Buttons
dashboard.section.buttons.val = {
  dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
  dashboard.button("f", "󰈞  Find file", ":Telescope find_files<CR>"),
  dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
  dashboard.button("s", "  Restore session", ":SessionManager load_session<CR>"),
  dashboard.button("q", "  Quit", ":qa<CR>"),
}

-- Footer
-- dashboard.section.footer.val = { "⚡ Neovim loaded. Happy Hacking!" }
dashboard.section.footer.val = {
  "",
  "              You have to be always drunk. That’s all there is to it—it’s the only way.",
  "        So as not to feel the horrible burden of time that breaks your back and bends",
  "                          you to the earth, you have to be continually drunk.",
	}



-- Set dashboard
alpha.setup(dashboard.opts)
EOF

