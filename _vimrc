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

au filetype python set expandtab


set nowrap				" Don't wrap lines that are wider than the screen
set autoread			" Reread changed files

set smartcase			" For searching

set lazyredraw			" Don't redraw while executing macros

set tabstop=4           " Number of spaces displayed for <TAB>
set shiftwidth=4
set softtabstop=4

set autoindent          " Use indentation of current line
set cindent
inoremap # X<BS>#
set wrap

set cole=2				" Conceal

set modeline			" read vim settings from files

set number              " Show line numbers
set showmatch           " Briefly jump to matching paren
set ruler               " Show current line/char position
set nohls               " Do not highlight search terms
set scrolloff=2					" Keep lines around cursor visible
set wildmode=longest,list		" Bash-like file auto-completion

set browsedir=buffer

set nobackup

set backspace=2         " Allow backspace to delete autoindent, eol, start
set incsearch           " Incremental search
set nocompatible
set background=dark

set nojoinspaces		" Use single space when joining sentences (not double)

syntax on
filetype off
filetype plugin on
filetype plugin indent on
inoremap # X# " Work around # comment indent problem

set foldenable          " Enable folding
set foldmethod=marker

set undodir=~/.vim/undo " Persistent undo
set undofile

set laststatus=2		" Statusline

set ttimeout			" Don't wait too long after pressing escape
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
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

Plugin 'benekastah/neomake'
Plugin 'nvie/vim-flake8'		" Pyflakes & PEP8
Plugin 'ctrlpvim/ctrlp.vim'		" File browsing
Plugin 'scrooloose/nerdtree'		" NERDTree
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'		" Snippets
Plugin 'honza/vim-snippets'
Plugin 'taglist.vim'			" TagList
Plugin 'tpope/vim-dispatch'		" dispatch for compiling and errors
Plugin 'tpope/vim-markdown'		" Newer markdown stuff
Plugin 'Valloric/YouCompleteMe'		" code completion
autocmd FileType c nnoremap <buffer> <silent> <C-]> :YcmCompleter GoTo<cr>
Plugin 'vim-scripts/JavaImp.vim--Lee'	" Automatically import java classes
Plugin 'nowk/genericdc'
Plugin 'vim-airline/vim-airline'	" Status line
Plugin 'vim-airline/vim-airline-themes'

let g:Tlist_Use_Right_Window = 1
let g:Tlist_Exit_OnlyWindow = 1

let g:airline_powerline_fonts = 1
let g:airline_theme='hybridline'
colo genericdc

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTirigger="<c-h>"

let g:ycm_global_ycm_extra_conf=
			\'~/.vim/bundle/YouCompleteMe/_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0

" change the mapleader from \ to ,
let mapleader=","

nmap		  <leader>t :NERDTreeToggle<CR>
nmap          <leader>m :w<cr>:Neomake!<CR>
nmap <silent> <leader>n :call NumberToggle()<CR>
map           <leader>l :TlistToggle<CR>
map  <silent> <leader>s :%s/\s*$//g<CR>``


set pastetoggle=<F2>

nnoremap ; :
map Y y$

cmap w!! w !sudo tee % >/dev/null  " For retroactive sudo

