if version >= 700

"------ Meta ------"
set nocompatible                " break away from old vi compatibility
filetype off                    " require by Vundle
set showcmd                     " show the command being typed
set shell=zsh
if (($TERM == "screen-256color") || ($TERM == "xterm-256color"))
    set t_Co=256                    " sets 256 colors mode
endif


"------ Console UI & Text display ------"

set encoding=utf-8
if has('gui_running')
    " :set guifont=Inconsolata\ Medium\ 12
    :set guifont=Terminus\ Regular\ 12
    :set guioptions-=m  "remove menu bar  might as well run vim...
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=R  "remove right-hand scroll bar
endif
colorscheme jellybeans
syntax on
filetype plugin indent on       " load filetype plugins and indent settings
set list                        " we do that to show tabs
set listchars=tab:>-,trail:-    " show tabs and trailing
set number                      " yay line numbers
set ruler                       " show current position at bottom
set noerrorbells                " don't whine
set visualbell t_vb=            " and don't make faces
set scrolloff=5                 " keep at least 5 lines around the cursor
"---- Recognize .pl extention as prolog instead of perl
"au BufNewFile,BufRead *.pl setfiletype prolog

"------ Text editing and searching behavior ------"

set nohlsearch                  " turn off highlighting for searched expressions
set incsearch                   " highlight as we search however
set showmatch                   " show matching brackets

"------ Indents and tabs ------"

set autoindent                  " set the cursor at same indent as line above
set smartindent                 " try to be smart about indenting (C-style)
set expandtab                   " expand <Tab>s with spaces; death to tabs!
set shiftwidth=4                " spaces for each step of (auto)indent
set softtabstop=4               " set virtual tab stop (compat for 8-wide tabs)
set tabstop=8                   " for proper display of files with tabs
set shiftround                  " always round indents to multiple of shiftwidth
set copyindent                  " use existing indents for new indents
set preserveindent              " save as much indent structure as possible
"autocmd BufWritePost * call system("ctags -R")

" backups
set backup
if exists("&backupdir")
    set backupdir=~/.vim/backups/
endif
if exists("&directory")
    set directory=~/.vim/swaps/
endif
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'

set tags+=~/.vim/tags,tags

"  Vundle stuff
" copy all the bundles to a new file for a cleaner .vimrc
" if filereadable(expand("~/.vim/bundles"))
"       source ~/.vimrc.bundles
" endif

"First of all download vundle if it isn't available, cba to download it manually
let vundleAvail=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let vundleAvail=0
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()


" Repos on github
" addons manager
Bundle 'gmarik/vundle'
"Search github
Bundle 'gmarik/github-search.vim'
"Ricer tier status line that is actually useful
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
"makes moving around the file much easier
Bundle 'Lokaltog/vim-easymotion'
"comment out lines
Bundle 'tpope/vim-commentary'
"Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML
"tags, and more. The plugin provides mappings to easily delete, change and add
"such surroundings in pairs.
Bundle 'tpope/vim-surround'
"Allows the use of the operator . to plugin commands
Bundle 'tpope/vim-repeat'
"Git wrapper
Bundle 'tpope/vim-fugitive'
" grep replacement
Bundle 'mileszs/ack.vim'
"might actually try the ack replacement! install: silversearcher-ag
"Bundle 'rking/ag.vim'
" Syntax checker
Bundle 'scrooloose/syntastic'
" Displays the filesystem
Bundle 'scrooloose/nerdtree'
" Shows relative numbers instead of the absolute number
Bundle 'myusuf3/numbers.vim'
" Inserts a closing ) } ' "
Bundle 'Townk/vim-autoclose'
" Headlights adds a menu to Vim, revealing your bundles (aka. plugins) and the
" features they provide.
Bundle 'mbadran/headlights'
" Paste code to Gist
Bundle 'mattn/gist-vim'
"This Vim plugin will pull C++ ptototypes into the implementation file
Bundle 'derekwyatt/vim-protodef'
"This Vim plugin will help switching between companion files (e.g. .h and
".cpp files) "
Bundle 'derekwyatt/vim-fswitch'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Bundle 'kien/ctrlp.vim'
" Lisp plugins
" Bundle 'kovisoft/slimv'
Bundle 'kien/rainbow_parentheses.vim'
" Bundle 'slimv.vim'
Bundle 'jpalardy/vim-slime'
"source code browser
Bundle 'majutsushi/tagbar'

"Auto-completion
"Bundle 'Valloric/YouCompleteMe'

"remember to switch to branch meu !!
Bundle 'zero808/c.vim'
"doxygen support
Bundle 'doxygen-support.vim'
"Latex support
Bundle 'latex-support.vim'

"non github repos
"other latex plugins
"Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
"Bundle 'git://git.code.sf.net/p/atp-vim/code'

if vundleAvail == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" utility functions
function CreateTags()
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    exec ':!ctags -R --languages=c -f ' . curNodePath . '/tags ' . curNodePath
endfunction
nmap <silent> <F4> :call CreateTags()<CR>


"--------  PLUGINS CONFIG -------------------------------------
"Syntasitc
let g:syntastic_cpp_compiler_options = ' -std=c++11'

"slime.vim
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
"nmap <leader>ss <Plug>SlimeLineSend

"airline
set laststatus=2
let g:airline_enable_syntastic=1
let g:airline_enable_tagbar=1
let g:airline_detect_modified=1
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts=0
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" if executable('ag')
" " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
"   " Use ag in CtrlP for listing files. Lightning fast and respects
"   .gitignore
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" elseif executable('ack')
" set grepprg=ack
"   endif "

"Latex-suite
"let g:tex_flavor='latex'
"--------------------------------------------------------------

"------ END VIM-500 ------"

endif " version >= 500
