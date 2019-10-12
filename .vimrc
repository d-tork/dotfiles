" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Sep 20
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" Get the defaults that most users want.

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'dhruvasagar/vim-table-mode'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


silent! so .vimlocal			" Source a local .vimrc file (named .vimlocal) for project-specific settings

source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Some decent VIM settings for programming
" These lines come from git-for-windows build-extra repository, along with
" stuff I've collected from the web

ru! defaults.vim                " Use Enhanced Vim defaults
set mouse=                      " Reset the mouse setting from defaults
aug vimStartup | au! | aug END  " Revert last positioned jump, as it is defined below
let g:skip_defaults_vim = 1     " Do not source defaults.vim again (after loading this system vimrc)

set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
set wildmode=list:longest,longest:full   " Better command line completion

" Show EOL type and last modified timestamp, right after the filename
" Set the statusline
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage

if &term =~ 'xterm-256color'    " mintty identifies itself as xterm-compatible
  if &t_Co == 8
    set t_Co = 256              " Use at least 256 colors
  endif
  " set termguicolors           " Uncomment to allow truecolors on mintty
endif
"------------------------------------------------------------------------------
" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Set UTF-8 as the default encoding for commit messages
    autocmd BufReadPre COMMIT_EDITMSG,MERGE_MSG,git-rebase-todo setlocal fileencodings=utf-8

    " Remember the positions in files with some git-specific exceptions"
    autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$")
      \           && &filetype !~# 'commit\|gitrebase'
      \           && expand("%") !~ "ADD_EDIT.patch"
      \           && expand("%") !~ "addp-hunk-edit.diff" |
      \   exe "normal g`\"" |
      \ endif

      autocmd BufNewFile,BufRead *.patch set filetype=diff

      autocmd Filetype diff
      \ highlight WhiteSpaceEOL ctermbg=red |
      \ match WhiteSpaceEOL /\(^+.*\)\@<=\s\+$/
endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
" NOTE: I am removing the next three lines myself because they're causing
" problems on The Tern
"if has('syntax') && has('eval')
"  packadd! matchit
"endif

" My personal changes
set number			" turn on line numbers
set relativenumber		" turn on relative numbers
let mapleader=","		" leader is comma
" jj is escape
inoremap jj <esc>		
set ruler			" show the ruler
set showcmd			" show the current command being typed
set incsearch			" display the match for a search pattern when halfway typing it
set hlsearch			" highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>	
" use F7 to manually check for file changes (following two commands)
nnoremap <F7> :checktime<CR>
map! <F7> <C-O>:checktime<CR>
set ignorecase smartcase	" case-insensitive searches (but sensitive when you specifically use a capital letter)

set autoread			" reload the file after changes have been made externally
au CursorHold,CursorHoldI * checktime	" autoread automatically (after 4 sec I think)
au FocusGained,BufEnter * :checktime	" same as above, under different conditions

" cycle through split windows
nnoremap <leader>w <C-W>w
"set foldmethod=manual		" activate folding (VI.SE #9543)
"set foldcolumn=2
"let g:markdown_folding = 1	" turn on folding for markdown
"let g:markdown_enable_folding = 1
" Change color scheme to zenburn
set t_Co=256
colorscheme zenburn

" change backup locations (SO 607435)
set backupdir=~/.vim/tmp//,.
set directory=~/.vim/tmp//,.

set wildmode=list:longest,longest:full	" Better command line completion

" Move between windows with arrow keys
nmap <Left> <C-W>h
nmap <Right> <C-W>l
nmap <Up> <C-W>k
nmap <Down> <C-W>j

autocmd BufEnter * silent! lcd %:p:h	" changes the window-local current directory to be the same as the dir of the current file

" Set tab stops for specific file types
autocmd FileType markdown setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4
autocmd FileType sql setlocal shiftwidth=4 tabstop=4

set splitbelow				" Open new horizontal splits on bottom
set splitright				" Open new vertical splits to right

" Auto indent for writing code
syntax on
filetype indent plugin on

