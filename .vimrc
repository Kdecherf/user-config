set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
   " let Vundle manage Vundle, required
   Plugin 'gmarik/Vundle.vim'

   Plugin 'robbles/logstash.vim'
   Plugin 'wincent/command-t'
   Plugin 'vim-airline/vim-airline'          " Pretty statusbar
   Plugin 'vim-airline/vim-airline-themes'   " Pretty statusbar themes
   Plugin 'tpope/vim-fugitive'         " Git wrapper
   Plugin 'altercation/vim-colors-solarized.git'
   Plugin 'edkolev/promptline.vim'

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

" Status bar -> Replace with vim-airplane plugin
set laststatus=2              " show ever
set showmode                  " show mode
set showcmd                   " show cmd
set ruler                     " show cursor line number
set shm=atI                   " cut large messages

" Colors
set background=dark
colorscheme solarized
hi Normal	ctermbg=NONE
hi NonText	ctermbg=NONE

vnoremap <C-X> <Esc>`.``gvP``P

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

"  vim-airline
let g:airline_inactive_collapse = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16'
