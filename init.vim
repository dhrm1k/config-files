:echo ">^.^<"


:set number

:set autoindent
:set mouse=i
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4

:set wrap
:set linebreak


inoremap jj <Esc>

:nnoremap <C-s> :w <CR>

call plug#begin()

Plug 'https://github.com/preservim/nerdtree.git' "File tree
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim' "Auto Completion
Plug 'vimwiki/vimwiki'
call plug#end()

set nocompatible
filetype plugin on
syntax on

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>


let g:NERDTreeWinSize=20

let g:ycm_auto_trigger = 1
let g:ycm_goto_previous_completion = '<C-p>'
let g:ycm_goto_next_completion = '<C-n>'

let g:coc_disable_startup_warning = 1

":colorscheme gruvbox
colorscheme nostromo
" Remapping tab to auto complete https://stackoverflow.com/a/67370376
" New to vim as well so open to corrections but C-y has worked for me. I think you can also navigate using just C-n and C-p to avoid having to press enter or anything at all.
" https://www.reddit.com/r/vim/comments/mat6nc/coc_how_to_use_autocomplete/ikh3n8i/
"
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"


autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


" Map Ctrl-S to save the file
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-s> <Esc>:w<CR>

"VimWiki
let g:vimwiki_diary_rel_path = 'diary'
let g:vimwiki_auto_diary_index = 1

" Open today's diary entry
nnoremap <Leader>dt :VimwikiMakeDiaryNote<CR>

" Open yesterday's diary entry
nnoremap <Leader>dy :VimwikiDiaryPrevDay<CR>

" Open tomorrow's diary entry
nnoremap <Leader>dm :VimwikiDiaryNextDay<CR>

" Open the diary index
nnoremap <Leader>di :VimwikiDiaryIndex<CR>

