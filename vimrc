colorscheme sunburst
set t_Co=256
hi Normal	ctermbg=NONE
hi NonText	ctermbg=NONE
set nocp
set mouse=a
set tabstop=3
set shiftwidth=3
set expandtab
set autoread
set cindent
set smartindent
set autoindent
filetype plugin on
autocmd BufNewFile,BufRead */source/_posts/*.markdown :set filetype=octopress
