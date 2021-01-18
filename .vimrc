"Remap leader key to spacebar
let mapleader = " "

"Open NERDtree when VIM begins
" autocmd vimenter * NERDTree
"Press <F2> to toggle NERDTree
map <F2> :NERDTreeToggle<CR>

"Press <F3> to toggle Undotree
nnoremap <F3> :UndotreeToggle<CR>

"Run remapping -- NEED TO CHANGE FOR DIFFERENT PROJECTS
autocmd Filetype python nnoremap <leader>r :term ./main.py<CR>

"Move between windows easily
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

"Move between buffers easily
"Next buffer in list
nnoremap <leader>, :bp<CR>
"Prev buffer in list
nnoremap <leader>. :bn<CR>
"Delete current buffer
nnoremap <leader>/ :bd!<CR>
                
"For competitive programming use
""Debug compile
autocmd filetype cpp noremap <F5> :w <bar> !g++ -std=c++17 -Wshadow -Wall % -o %:r.bin -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR>
""Compile
autocmd filetype cpp noremap <F7> :w <bar> !g++ -std=c++17 -O2 -Wshadow -Wall -Wextra % -o %:r.bin<CR>
""Run
autocmd filetype cpp noremap <F8> :!./%:r.bin < in<CR>
autocmd filetype python noremap <F8> :!python3 %:r.py < in<CR>
if has('nvim')
    ""Create input file for problem input
    autocmd filetype cpp noremap <F6> :te cat > in<CR>
    autocmd filetype python noremap <F6> :te cat > in<CR>
    autocmd filetype cpp noremap <F8> :te ./%:r.bin < in<CR>
    autocmd filetype python noremap <F8> :te python3 %:r.py < in<CR>
endif
""Remove file
autocmd filetype cpp noremap <F4> :!rm %:r.bin<CR>

"Copy (write) highlighted text to .vimbuffer
vmap <leader>y y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
"Copy whole file to .vimbuffer
nmap <leader>y ggVG<leader>y

"Set nowrap for writing Markdown files
augroup Markdown
    autocmd!
    autocmd Filetype markdown set wrap
augroup END

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
set undodir=~/.vim/undodir
set undofile
set title
set clipboard+=unnamedplus "For neovim clipboard functionality

syntax enable

"Bracket expansions
inoremap {<Cr> {<Cr>}<ESC>O

""""""""""""""""""Vim Plugins (vim-plug)"""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

""""""""""""""""""Color Schemes"""""""""""""""""""""""
"colorscheme darcula

let g:gruvbox_contrast_dark = 'medium' "Set contrast 'soft', 'medium', 'hard'
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
nnoremap <silent> <Leader>g :GFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>

"For coc.nvim
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
