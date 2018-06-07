:colorscheme desert
:syntax on
:set number
:set autoindent
:set incsearch
:set ts=4
:set smartindent
:set tabstop=4
:set shiftwidth=4
:set nohlsearch
:set fo+=t
:set textwidth=80
:set tw=80
:set cindent
:set noexpandtab
:set ruler

:filetype on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'https://github.com/fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'timonv/vim-cargo'
Plugin 'http://github.com/ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'


set pumheight=20 

call vundle#end()
:filetype plugin indent on

let g:NERDTreeWinPos = "left"

set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start

command EflStyle set ts=8 sw=3 sts=3 expandtab cino=>5n-3f0^-2{2(0W1st0
command CStyle set ts=4 sw=4 sts=0 noexpandtab cino&

set list
set listchars=tab:>\ ,eol:$
