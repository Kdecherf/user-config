set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
   " let Vundle manage Vundle, required
   Plugin 'gmarik/Vundle.vim'

   Plugin 'itchyny/lightline.vim'
   Plugin 'junegunn/fzf.vim'
   Plugin 'junegunn/fzf'
   Plugin 'tpope/vim-surround'
   Plugin 'airblade/vim-gitgutter'
   Plugin 'dhruvasagar/vim-table-mode'
   Plugin 'nathanaelkane/vim-indent-guides'
   Plugin 'mileszs/ack.vim'
   Plugin 'tpope/vim-vinegar'
   Plugin 'editorconfig/editorconfig-vim'
   Plugin 'terryma/vim-multiple-cursors'

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
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

vnoremap <C-X> <Esc>`.``gvP``P

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

