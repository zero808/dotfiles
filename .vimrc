if version >= 700

"call pathogen#infect()

"------ Meta ------"
set nocompatible                " break away from old vi compatibility
filetype off			" require by Vundle
set showcmd                     " show the command being typed
set shell=zsh
if (($TERM == "screen-256color") || ($TERM == "xterm-256color"))
    set t_Co=256                    " sets 256 colors mode
endif


"------ Console UI & Text display ------"

set encoding=utf-8
if has('gui_running')
    "set guifont=Inconsolata\ Medium\ 12
    set guifont=Terminus\ Regular\ 12
    ":set guioptions-=m  "remove menu bar  might as well run vim...
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
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

"	Vundle stuff
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 " Launch vim, run :BundleInstall
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
"Ricer tier status line
Bundle 'Lokaltog/vim-powerline'
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
" Bundle 'tpope/vim-fugitive'
" grep replacement
Bundle 'mileszs/ack.vim'
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

"Auto-completion
"Bundle 'Valloric/YouCompleteMe'

"vim-scripts repos
"turn vim into a C/C++ ide
Bundle 'c.vim'
"doxygen support
Bundle 'doxygen-support.vim'
"Latex support
Bundle 'latex-support.vim'
"source code browser
Bundle 'taglist.vim'

"non github repos
"Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
" Bundle 'git://git.code.sf.net/p/atp-vim/code'

if vundleAvail == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

"--------  PLUGINS CONFIG -------------------------------------
"Syntasitc
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" Powerline
set laststatus=2
let g:Powerline_symbols = 'fancy'

"Latex-suite
"let g:tex_flavor='latex'
"--------------------------------------------------------------

"------ END VIM-500 ------"

endif " version >= 500
