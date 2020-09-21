"For competitive programming use
""Debug compile
autocmd filetype cpp nnoremap <C-F9> :w <bar> !g++ -std=c++17 -Wshadow -Wall % -o %:r.bin -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR>
""Compile
autocmd filetype cpp nnoremap <C-F10> :w <bar> !g++ -std=c++17 -O2 -Wshadow -Wall % -o %:r.bin<CR>
""Run
autocmd filetype cpp nnoremap <C-F11> :!./%:r.bin<CR>
""Remove file
autocmd filetype cpp nnoremap <C-F6> :!rm %:r.bin<CR>

" copy (write) highlighted text to .vimbuffer
vmap <C-S-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>

set expandtab "Expand tabs into spaces
set tabstop=4 "4 space tabs
set shiftwidth=4 "4 space shift
set softtabstop=4 "Tab spaces in no hard tab mode
set smartindent
set nu rnu "Relative numbered lines
set mouse=a
set cursorline
set colorcolumn=81
set ft=asm
set t_ut = ""

set title "Set window title to file

inoremap {<Cr> {<Cr>}<ESC>O

syntax enable
colorscheme darcula

