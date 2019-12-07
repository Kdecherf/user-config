set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
   " let Vundle manage Vundle, required
   Plugin 'gmarik/Vundle.vim'

   Plugin 'gkapfham/vim-vitamin-onec'

   Plugin 'itchyny/lightline.vim'
   Plugin 'junegunn/fzf.vim'
   Plugin 'junegunn/fzf'
   Plugin 'tpope/vim-surround'
   Plugin 'dhruvasagar/vim-table-mode'
   Plugin 'nathanaelkane/vim-indent-guides'
   Plugin 'mileszs/ack.vim'
   Plugin 'tpope/vim-vinegar'
   Plugin 'editorconfig/editorconfig-vim'
   Plugin 'terryma/vim-multiple-cursors'
   Plugin 'tpope/vim-commentary'

   " git-related plugins
   Plugin 'rhysd/git-messenger.vim'
   Plugin 'airblade/vim-gitgutter'

   " syntax-related plugins
   Plugin 'lumiliet/vim-twig'

   " All of your Plugins must be added before the following line
call vundle#end()            " required

set nocp
set mouse=a
set autoread
set cindent
syntax on
set number
set showmatch
set noshowmode
filetype plugin on

" Tabs
set smartindent
set autoindent
set expandtab
set tabstop=3
set shiftwidth=3

" Searches
set hlsearch
set ignorecase
set smartcase

set laststatus=2              " show ever
set noshowmode                " no show mode (dup with lightline)
set showcmd                   " show cmd
set ruler                     " show cursor line number
set shm=atI                   " cut large messages

set background=dark
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif
colorscheme vitaminonec

" colorscheme overrides
hi Search ctermbg=236 cterm=NONE
hi Normal ctermfg=250

vnoremap <C-X> <Esc>`.``gvP``P

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
nnoremap T :Tags<CR>
nnoremap t :BTags<CR>
set tags=./.ctags.out;

" cscope
function! Cscope(option, query)
  let color = '{ x = $1; $1 = ""; z = $3; $3 = ""; printf "\033[34m%s\033[0m:\033[31m%s\033[0m\011\033[37m%s\033[0m\n", x,z,$0; }'
  let opts = {
  \ 'source':  "cscope -i .cscope.files -f .cscope.out -dL" . a:option . " " . a:query . " | awk '" . color . "'",
  \ 'options': ['--ansi', '--prompt', '> ',
  \             '--multi', '--bind', 'alt-a:select-all,alt-d:deselect-all',
  \             '--color', 'fg:188,fg+:222,bg+:#3a3a3a,hl+:104'],
  \ 'down': '40%'
  \ }
  function! opts.sink(lines)
    let data = split(a:lines)
    let file = split(data[0], ":")
    execute 'e ' . '+' . file[1] . ' ' . file[0]
  endfunction
  call fzf#run(opts)
endfunction
" Go to definition
nnoremap <silent> gd :call Cscope('1', expand('<cword>'))<CR>
" Functions calling this function
nnoremap <silent> gf :call Cscope('3', expand('<cword>'))<CR>

" git-messenger configuration
let g:git_messenger_no_default_mappings = v:true
nmap gm <Plug>(git-messenger)

if executable('ag')
  let g:ackprg = 'ag --path-to-ignore ~/.ignore --vimgrep'
endif

