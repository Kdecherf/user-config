set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
   " let Vundle manage Vundle, required
   Plugin 'gmarik/Vundle.vim'

   Plugin 'NLKNguyen/papercolor-theme'

   Plugin 'itchyny/lightline.vim'
   Plugin 'junegunn/goyo.vim'
   Plugin 'junegunn/limelight.vim'
   Plugin 'voldikss/vim-floaterm'
   Plugin 'junegunn/fzf.vim'
   Plugin 'junegunn/fzf'
   Plugin 'tpope/vim-surround'
   Plugin 'dhruvasagar/vim-table-mode'
   Plugin 'nathanaelkane/vim-indent-guides'
   Plugin 'editorconfig/editorconfig-vim'
   Plugin 'terryma/vim-multiple-cursors'
   Plugin 'lambdalisue/reword.vim'
   Plugin 'tpope/vim-commentary'
   Plugin 'majutsushi/tagbar'
   Plugin 'tpope/vim-obsession'
   Plugin 'MattesGroeger/vim-bookmarks'
   Plugin 'junegunn/vim-easy-align'

   " coc
   Plugin 'antoinemadec/coc-fzf'
   Plugin 'neoclide/coc.nvim', {'branch': 'release'}

   " git-related plugins
   Plugin 'rhysd/git-messenger.vim'
   Plugin 'tpope/vim-fugitive'
   Plugin 'airblade/vim-gitgutter'

   " syntax-related plugins
   Plugin 'lumiliet/vim-twig'
   Plugin 'StanAngeloff/php.vim'

   Plugin 'pangloss/vim-javascript'
   Plugin 'elzr/vim-json'
   Plugin 'fatih/vim-go'
   Plugin 'plasticboy/vim-markdown'
   Plugin 'hashivim/vim-terraform'
   Plugin 'tpope/vim-salve'
   Plugin 'tpope/vim-projectionist'
   Plugin 'tpope/vim-dispatch'
   Plugin 'tpope/vim-fireplace'

   Plugin 'luochen1990/rainbow'

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
nnoremap ch :nohls<CR>

set list
set lcs=tab:»·
set lcs+=trail:·

set laststatus=2              " show ever
set noshowmode                " no show mode (dup with lightline)
set showcmd                   " show cmd
set ruler                     " show cursor line number
set shm=atI                   " cut large messages

" Colorscheme configuration
set background=dark
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif


vnoremap <C-X> <Esc>`.``gvP``P

nnoremap ; :Buffers<CR>
nnoremap ff :Files<CR>
nnoremap fg :GFiles<CR>
nnoremap fs :GFiles?<CR>
nnoremap T :Tags<CR>
nnoremap t :BTags<CR>
nnoremap s :Ag<CR>
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.dark': {
  \       'override' : {
  \         'cursorline' : ['#080808', '233'],
  \         'linenumber_bg' : ['#080808', '233'],
  \         'cursorcolumn' : ['#080808', '233'],
  \         'visual_fg' : ['NONE', 'NONE'],
  \         'visual_bg' : ['#8787af', '237']
  \       }
  \     }
  \   }
  \ }
colorscheme PaperColor
set colorcolumn=120

highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$/

set tags=./.ctags.out;


" git-messenger configuration
let g:git_messenger_no_default_mappings = v:true
nmap gm <Plug>(git-messenger)

" jump to next conflict marker in git
map <silent> <C-U> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<CR>

let g:rainbow_active = 0
" coc
let g:coc_disable_startup_warning = 1
let g:coc_fzf_preview = 'right:50%'
let g:coc_fzf_opts = [ '--preview="bat --line-range :300 {}"' ]

let g:coc_global_extensions = [
   \  "coc-css",
   \  "coc-docker",
   \  "coc-explorer",
   \  "coc-floaterm",
   \  "coc-fzf-preview",
   \  "coc-git",
   \  "coc-highlight",
   \  "coc-html",
   \  "coc-json",
   \  "coc-lists",
   \  "coc-phpls",
   \  "coc-sh",
   \  "coc-syntax",
   \  "coc-tag",
   \  "coc-tsserver",
   \  "coc-yaml"
   \ ]

" Completion
set updatetime=300

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>ac  <Plug>(coc-codeaction)

autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

nnoremap <silent> <space>c  :<C-u>CocFzfList commands<cr>
nnoremap <silent> <space>d  :<C-u>CocFzfList diagnostics --current-buf<cr>
nnoremap <silent> <space>D  :<C-u>CocFzfList diagnostics<cr>
nnoremap <silent> <space>o  :<C-u>CocFzfList outline<cr>
nnoremap <silent> <space>t  :<C-u>CocFzfList symbols<cr>
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>

" floaterm
nnoremap <silent> <leader>fn :FloatermNew<CR>
tnoremap <silent> <C-k> <C-\><C-n>:FloatermPrev<CR>
tnoremap <silent> <C-j> <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <C-f> :FloatermToggle<CR>
tnoremap <silent> <C-f> <C-\><C-n>:FloatermToggle<CR>

" coc-git
nmap <leader>gc <Plug>(coc-git-commit)
nmap <leader>gp <Plug>(coc-git-prevchunk)
nmap <leader>gp <Plug>(coc-git-nextchunk)
nmap <leader>gs <Plug>(coc-git-chunkinfo)
nmap <leader>ga :CocCommand git.chunkStage<CR>
nmap <leader>gu :CocCommand git.chunkUndo<CR>
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" goyo+limelight
nnoremap <silent> gO :Goyo<CR>:Limelight<CR>
nnoremap <silent> go :Goyo<CR>
autocmd! User GoyoLeave Limelight!
