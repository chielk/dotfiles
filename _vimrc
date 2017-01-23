"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                         vimrc                       "
"                                                     "
"   by Chiel Kooijman <chielkooijman@protonmail.ch>   "
"                                                     "
"                2010-10-19 - 2016-03-26              "
"                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:snips_author = 'Chiel Kooijman'
let g:snips_student_id = '5743028'

au BufNewFile,BufRead *.tex  set filetype=tex
au BufNewFile,BufRead *.go   set filetype=go
au BufNewFile,BufRead *.md   set filetype=markdown


set nowrap                  " Don't wrap lines that are wider than the screen
set autoread                " Reread changed files

set smartcase               " For searching

set lazyredraw              " Don't redraw while executing macros

set tabstop=4               " Number of spaces displayed for <TAB>
set shiftwidth=4
set softtabstop=4

set autoindent              " Use indentation of current line
set cindent
inoremap # X<BS>#
set wrap

set cole=2                  " Conceal

set modeline                " read vim settings from files

set number                  " Show line numbers
set showmatch               " Briefly jump to matching paren
set ruler                   " Show current line/char position
set nohls                   " Do not highlight search terms
set scrolloff=2             " Keep lines around cursor visible
set wildmode=longest,list   " Bash-like file auto-completion

set browsedir=buffer

set nobackup

set backspace=2             " Allow backspace to delete autoindent, eol, start
set incsearch               " Incremental search
set background=dark

set nojoinspaces            " Use single space when joining sentences

" Work around # comment indent problem
inoremap # X#

set foldenable              " Enable folding
set foldmethod=marker

set undodir=~/.vim/undo     " Persistent undo
set undofile

set backupdir=~/.vim/backup
set directory=~/.vim/backup

set laststatus=2            " Statusline

set ttimeout                " Don't wait too long after pressing escape
set ttimeoutlen=100

" restore file position after closing
function! ResCur()
  if line("'\"") <= line("$")
    execute "normal! g`\""
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

function! NumberToggle()
  let w:n_mode = exists('w:n_mode') ? (w:n_mode+1)%3 : 0
  if w:n_mode == 0
    set relativenumber
  elseif w:n_mode == 1
    set norelativenumber
  else
    set number
  endif
endfunction

set t_Co=256

highlight ExtraWhitespace ctermbg=236
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Highlight whitespace at the end of lines
highlight OverLength ctermfg=red cterm=undercurl
match OverLength /\%79v.\+/
" 1 column with line
set colorcolumn=+1        " highlight column after 'textwidth'
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey

" Simplify movement around windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle, required!
Plugin 'VundleVim/Vundle.vim'

Plugin 'nvie/vim-flake8'            " Pyflakes & PEP8
Plugin 'tmhedberg/SimpylFold'
Plugin 'ctrlpvim/ctrlp.vim'          " File browsing

Plugin 'ConradIrwin/vim-bracketed-paste' " Automatic :set paste
" Text objects
Plugin 'kana/vim-textobj-user'
Plugin 'bps/vim-textobj-python'
Plugin 'rbonvall/vim-textobj-latex'

Plugin 'scrooloose/nerdtree'        " NERDTree
Plugin 'SirVer/ultisnips'            " Snippets
Plugin 'honza/vim-snippets'
Plugin 'vim-scripts/taglist.vim'    " TagList

Plugin 'tpope/vim-unimpaired'        " Key bindings
Plugin 'tpope/vim-fugitive'          " Git bindings
Plugin 'tpope/vim-dispatch'          " dispatch for compiling and errors
autocmd FileType python let b:dispatch = ':Make %'
Plugin 'vim-scripts/pytest-compiler'
autocmd FileType python let compiler = 'pytest'
Plugin 'alfredodeza/coveragepy.vim'

Plugin 'Valloric/YouCompleteMe'      " code completion
autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
Plugin 'vim-scripts/JavaImp.vim--Lee'  " Automatically import java classes
Plugin 'nowk/genericdc'
Plugin 'vim-airline/vim-airline'    " Status line
Plugin 'vim-airline/vim-airline-themes'

" All of your Plugins must be added before the following line
call vundle#end()                    " required
filetype plugin indent on            " required
syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_import = 0

let g:Tlist_Use_Right_Window = 1
let g:Tlist_Exit_OnlyWindow = 1

let g:airline_powerline_fonts = 1
let g:airline_theme='hybridline'

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTirigger="<c-h>"

let g:ycm_global_ycm_extra_conf=
      \'~/.vim/bundle/YouCompleteMe/_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

" change the mapleader from \ to ,
let mapleader=","

nmap          <leader>t :NERDTreeToggle<CR>
nmap <silent> <leader>n :call NumberToggle()<CR>
map           <leader>l :TlistToggle<CR>
map  <silent> <leader>s :%s/\s*$//g<CR>``
map                <F8> :Dispatch<CR>
map                <F9> :Coveragepy report<CR>
map               <F10> :Coveragepy session<CR>


set pastetoggle=<F2>

map Y y$

cmap w!! w !sudo tee % >/dev/null  " For retroactive sudo

" Fix background colour for empty space
set t_ut=

colo genericdc

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
