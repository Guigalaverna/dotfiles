" Author: Guilherme Galaverna
" Source: https://github.com/Guigalaverna/dotfiles

" Leader Key

let mapleader=","

" Compatibility
" Set 'nocompatible'

set nocompatible
set t_ut=

" Bundle
" Automatically download vim-plug if it dosen't exists

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Configure vim-plug

call plug#begin('~/.vim/bundle')

	Plug 'scrooloose/nerdtree'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'mxw/vim-jsx'
	Plug 'leafgarland/typescript-vim'
	Plug 'lilydjwg/colorizer'

call plug#end()

" Syntax
" Enable syntax highlighting
syntax on

" Search
" Highlight search term. Use :nohl to redraw screen and disable highlight
set hlsearch

" Make Ag search from your project root
let g:ag_working_path_mode="r"

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" AUTO IDENTATION
" Enable auto identation with 'spaces' instead of 'tabs'
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2

" MOVING BETWEEN FILES
" Set 'hidden' if you want to open a new file inside the same buffer without the
" need to save it first (if there's any unsaved changes).
set hidden

set viminfo='10,\"100,:20,%,n~/.viminfo

function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" BACKUP
" Disable all backup files, never used them
set nobackup
set nowritebackup
set noswapfile


" SYNTASTIC
" Syntastic is a syntax checking plugin for Vim that runs files through
" external syntax checkers and displays any resulting errors to the user.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure Standar JS as default linter
let g:syntastic_javascript_checkers = ['standard']

" FONT
set guifont=Fira\ Code:8
set antialias

" ENCODING
set encoding=utf-8

" COMMAND LINE
" Enhanced command line completion
set wildmenu

" Complete files like a shell
set wildmode=list:longest

" SEARCH
" Vim will start searching as you type
set incsearch

" FILE NUMBERS
" Enable relative and absolute file numbers
set number relativenumber

" WRAP
" Stop wrapping long lines
set nowrap

" AUTORELOAD
" Automatically reload buffers when file changes
set autoread

" PLUGINS CONFIGURATIONS

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Syntastic
nnoremap <leader>st :SyntasticToggleMode<cr>

" NERDTree
nnoremap <leader>ft :NERDTreeToggle<cr>
