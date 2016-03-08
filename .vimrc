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

map <C-c> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .


:filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'snipmate'
Plugin 'http://github.com/Rip-Rip/clang_complete'
"Plugin 'Shougo/neocomplete'
Plugin 'https://github.com/fatih/vim-go'

let g:clang_library_path='/usr/lib/llvm-3.6/lib/libclang.so.1'
let g:clang_complete_macros = 1
"set completeopt=menu,menuone
set pumheight=20 

call vundle#end()
:filetype plugin indent on

let g:NERDTreeWinPos = "left"

set omnifunc=syntaxcomplete#Complete
set backspace=indent,eol,start

" add current directory's generated tags file to available tags
set tags+=./tags

command EflStyle set ts=8 sw=3 sts=3 expandtab cino=>5n-3f0^-2{2(0W1st0
command CStyle set ts=4 sw=4 sts=0 noexpandtab cino&

set list
set listchars=tab:>\ ,eol:$

function! DelTagOfFile(file)
   let fullpath = a:file
   let cwd = getcwd()
   let tagfilename = cwd . "/tags"
   let f = substitute(fullpath, cwd . "/", "", "")
   let f = escape(f, './')
   let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
   let resp = system(cmd)
endfunction

function! UpdateTags()
   let f = expand("%:p")
   let cwd = getcwd()
   let tagfilename = cwd . "/tags"
   let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
   call DelTagOfFile(f)
   let resp = system(cmd)
endfunction

map <F4> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git --include=*.{c,cpp,h} . -e " . expand("<cword>") . " " <bar> cwindow<CR>

"Tizen SDK eclipse should be in PATH"
function TizenSDKBuild(project, config, clean)
   let cwd = getcwd()
   let project = a:project
   if a:project ==? ""
      let project = fnamemodify(getcwd(), ':t')
   endif
   if a:clean ==? 1
      let buildOpt = "-cleanBuild"
   else
      let buildOpt = "-build"
   endif
   let cmd = 'eclipse -nosplash --launcher.suppressErrors -import ' . cwd . ' -application org.eclipse.cdt.managedbuilder.core.headlessbuild ' . buildOpt . ' ' . project . '/' . a:config
   echom cmd
   " quickfix for wrong paths in output (output's cwd is src)
   cexpr system(cmd) | copen
endfunction

map <C-v> :call TizenSDKBuild('', 'Debug', 0)
