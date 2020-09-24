"Remap leader key to spacebar
let mapleader = " "

"Open NERDtree when VIM begins
" autocmd vimenter * NERDTree
"Press <F2> to toggle NERDTree
map <F2> :NERDTreeToggle<CR>

" Move between windows easily
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"For competitive programming use
""Debug compile
autocmd filetype cpp noremap <F5> :w <bar> !g++ -std=c++17 -Wshadow -Wall % -o %:r.bin -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR>
""Compile
autocmd filetype cpp noremap <F7> :w <bar> !g++ -std=c++17 -O2 -Wshadow -Wall % -o %:r.bin<CR>
""Run
autocmd filetype cpp noremap <F8> :!./%:r.bin<CR>
if has('nvim')
    autocmd filetype cpp noremap <F8> :te ./%:r.bin<CR> i
endif
""Remove file
autocmd filetype cpp noremap <F4> :!rm %:r.bin<CR>

"Copy (write) highlighted text to .vimbuffer
vmap <leader>y y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
"Copy whole file to .vimbuffer
nmap <leader>y ggVG<leader>y


set noerrorbells
set hlsearch
set incsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set scrolloff=4
set nu rnu
set nowrap
set noswapfile
set mouse=a
set colorcolumn=81
set noshowmode
set t_ut = ""
set bg=dark
set termguicolors
set title
set clipboard+=unnamedplus "For neovim clipboard functionality

syntax enable

"Bracket expansions
inoremap {<Cr> {<Cr>}<ESC>O

""""""""""""""""""Vim Plugins (vim-plug)"""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""""""""""""""""""Color Schemes"""""""""""""""""""""""
"colorscheme darcula

let g:gruvbox_contrast_dark = 'hard' "Set contrast 'soft', 'medium', 'hard'
colorscheme gruvbox

"colorscheme codedark "(VSCode-like)

"colorscheme onedark "(Atom-like)

""""""""""""""""""Others""""""""""""""""""""""""
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ">"
let g:airline_right_sep = "<"
let g:airline#extensions#tabline#enabled = 1

"For fzf
if executable('rg')
    let g:rg_derive_root='true'
endif
let $FZF_DEFAULT_OPTS='--reverse -m'
nnoremap <silent> <C-f> :GFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>

"For coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
