" .vimrc
" Author: dtork

silent! so .vimlocal 			" Source a local .vimrc file (named .vimlocal) for project-specific settings

" From Bram Moolenaar
source $VIMRUNTIME/defaults.vim
if &compatible
  set nocompatible               " Be iMproved
endif

ru! defaults.vim		" Use Enhanced Vim defaults
set mouse=			" Reset the mouse setting from defaults
set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set showmode                    " show the current mode

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

"
" Basic settings and variables {{{

colorscheme desert

syntax on
filetype indent plugin on		" auto indent for writing code
set encoding=utf-8
set visualbell noerrorbells		" don't beep
set hlsearch				" highlight matches
set incsearch				" display the match for a search pattern as it's typed
set ruler				" show the ruler
set showcmd				" show the current command being typed
set ignorecase smartcase		" case-insensitive searches (but sensitive when you specifically use a capital letter)
set clipboard=unnamed			" set clipboard to unnamed to access the system clipboard under Windows
set wildmode=list:longest,longest:full	" better line completion
set autoread				" reload the file after changes have been made externally
set tabstop=4 shiftwidth=4 expandtab	" set default tab/shift/expand
set nospell				" disable spellcheck (for code)
set number relativenumber		" line numbers
set splitbelow				" open new horizontal splits on bottom
set splitright				" open new vertical splits to right
set backspace=indent,eol,start		" allow backspacing over everything in insert mode
let mapleader=","			" leader is comma
" TODO: check if system is Win or *nix
set ffs=dos,unix			" line endings for Windoze first for new buffers


" End Basic settings and variables }}}


" Keyboard shortcuts and remappings {{{

" Run current file as python script
nnoremap <F5> :w<CR>:!clear;python %<CR>
inoremap <F5> <Esc>:w<CR>:!clear;python %<CR>
" Space to toggle folds
nnoremap <Space> za
vnoremap <Space> za
" jj is escape
inoremap jj <Esc>
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Move between windows with Ctrl+<movement>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
" Move between buffers with arrow keys
nmap <Right> :bnext<CR>
imap <Right> <Esc>:bnext<CR>
nmap <Left> :bprev<CR>
imap <Left> <Esc>:bprev<CR>
" Insert datetime
nnoremap <F4> "=strftime("%d%b%Y")<CR>PviwgU
inoremap <F4> <C-R>=strftime("%d%b%Y")<CR><Esc>viwgUea
" Mappings/settings for table mode
nnoremap <leader> tm
let g:table_mode_corner='|'

" End Keyboard shortcuts and remappings }}}


" Auto-commands {{{

aug tork
	"Remove all autocommands for the current group.
	au!
	" .md extension is markdown
	au BufRead,BufNewFile *.md set ft=markdown foldlevel=2 wrap linebreak textwidth=0 wrapmargin=0 spell
	if v:version > 703
		au BufRead,BufNewFile *.md set colorcolumn=80
	endif
aug END

au CursorHold,CursorHoldI * checktime	" autoread automatically (after 4 sec I think)
au FocusGained,BufEnter * :checktime	" same as above, under different conditions

autocmd BufEnter * silent! lcd %:p:h	" changes the window-local current directory to be the same as the dir of the current file
" set autochdir				" same as above, except it may cause
" problems with some plugins

" == From Bram Moolenaar==
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

" End Auto-commands }}}


" Quick Editing {{{

" Edit .bashrc
nmap <silent> <leader>eb :e ~/.bashrc<CR>
" Edit .vimrc
nmap <silent> <leader>ev :e ~/.vimrc<CR>
" Edit .gitconfig
nmap <silent> <leader>eg :e ~/.gitconfig<CR>
" Open a scratch file
nmap <silent> <leader>eh :e ~/scratch.txt<CR>

" End Quick Editing }}}

