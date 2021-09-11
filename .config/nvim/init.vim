set nocompatible              " be iMproved, required

let data_dir = '~/.local/share/nvim'
if empty(glob(data_dir . '/site/autoload/plug.vim'))
   silent execute '!curl -fLo '.data_dir.'/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.local/share/nvim/plugged')
   " Colorscheme and related
   Plug 'tomasiser/vim-code-dark'

   " Interface
   Plug 'itchyny/lightline.vim'
   Plug 'junegunn/goyo.vim'
   Plug 'junegunn/limelight.vim'
   Plug 'voldikss/vim-floaterm'
   Plug 'nathanaelkane/vim-indent-guides'
   Plug 'majutsushi/tagbar'

   " Functionalities
   Plug 'tpope/vim-projectionist'
   Plug 'tpope/vim-obsession'
   Plug 'junegunn/fzf.vim'
   Plug 'junegunn/fzf'
   Plug 'editorconfig/editorconfig-vim'
   Plug 'jamessan/vim-gnupg'

   " Productivity
   Plug 'lambdalisue/reword.vim'
   Plug 'tpope/vim-surround'
   Plug 'tpope/vim-dispatch'
   Plug 'tpope/vim-commentary'
   Plug 'junegunn/vim-easy-align'
   Plug 'dhruvasagar/vim-table-mode'
   Plug 'terryma/vim-multiple-cursors'
   Plug 'MattesGroeger/vim-bookmarks' " TODO find replacement with fzf and/or coc support

   " coc
   " Plug 'antoinemadec/coc-fzf'
   Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}

   " Git
   Plug 'rhysd/git-messenger.vim'
   Plug 'tpope/vim-fugitive'
   Plug 'airblade/vim-gitgutter'

   " Languages
   Plug 'lumiliet/vim-twig'
   Plug 'StanAngeloff/php.vim'
   Plug 'pangloss/vim-javascript'
   Plug 'elzr/vim-json'
   Plug 'fatih/vim-go'
   Plug 'plasticboy/vim-markdown'
   Plug 'hashivim/vim-terraform'
   " clojure
   Plug 'tpope/vim-salve'
   Plug 'tpope/vim-fireplace'

   Plug 'antoinemadec/FixCursorHold.nvim'
call plug#end()

set nocp
set mouse=a
set autoread
set cindent
syntax on
set number
set showmatch
filetype plugin on

let mapleader = ","

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
set showcmd                   " show cmd
set ruler                     " show cursor line number
set shm=atI                   " cut large messages

" Colorscheme configuration
set background=dark
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

colorscheme codedark
set colorcolumn=120

highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$/

" lightline
set noshowmode                " no show mode (dup with lightline)


set tags=./.ctags.out;

vnoremap <C-X> <Esc>`.``gvP``P

" fzf
nnoremap <leader>; :Buffers<CR>
nnoremap <C-p> :Files<CR>
nnoremap <leader>fd :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <leader>fh :Files $HOME/<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fs :GFiles?<CR>
nnoremap <leader>T :Tags<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>s :Ag<CR>
nnoremap <leader>S :FullAg<CR>
let g:fzf_commits_log_options = '--graph --color=always --format="%C(yellow)%h%C(red)%d%C(reset) - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': 'call Centered_floating_window(v:true)' }
command! -bang -nargs=* FullAg call fzf#vim#ag(<q-args>, ' --hidden --skip-vcs-ignores --ignore ".git" ' , <bang>0)

" indent-guides
nnoremap <leader>ig :IndentGuidesToggle<CR>
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=237

" git-messenger configuration
let g:git_messenger_no_default_mappings = v:true
nmap gm <Plug>(git-messenger)

" jump to next conflict marker in git
map <silent> <C-U> /^\(<\{7\}\\|>\{7\}\\|=\{7\}\\|\|\{7\}\)\( \\|$\)<CR>

" rainbow
let g:rainbow_active = 1

" easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

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

" Splits
set splitbelow
set splitright

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
nnoremap <silent> <leader>gO :Goyo<CR>:Limelight<CR>
nnoremap <silent> <leader>go :Goyo<CR>
autocmd! User GoyoLeave Limelight!

" tagbar
nnoremap <leader>tb :TagbarToggle<CR>

" functions
function! Centered_floating_window(border)
    let width = min([&columns - 4, max([120, &columns - 30])])
    let height = min([&lines - 4, max([20, &lines - 20])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    if a:border == v:true
        let top = "┌" . repeat("─", width - 2) . "┐"
        let mid = "│" . repeat(" ", width - 2) . "│"
        let bot = "└" . repeat("─", width - 2) . "┘"
        let lines = [top] + repeat([mid], height - 2) + [bot]
        let s:buf = nvim_create_buf(v:false, v:true)
        call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
        call nvim_open_win(s:buf, v:true, opts)
        set winhl=Normal:Normal
        let opts.row += 1
        let opts.height -= 2
        let opts.col += 2
        let opts.width -= 4
        call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
        au BufWipeout <buffer> exe 'bw '.s:buf
    else
        call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    endif
endfunction

nmap <leader>ed :CocCommand explorer<CR>
nmap <leader>ef :CocCommand explorer --position floating<CR>

let g:cursorhold_updatetime = 100

set cursorline
set cursorcolumn
