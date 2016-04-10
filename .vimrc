set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
   " let Vundle manage Vundle, required
   Plugin 'gmarik/Vundle.vim'

   Plugin 'robbles/logstash.vim'
   Plugin 'wincent/command-t'

   " All of your Plugins must be added before the following line
call vundle#end()            " required

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
syntax on
set hlsearch
filetype plugin on

vnoremap <C-X> <Esc>`.``gvP``P

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t\|\t/
