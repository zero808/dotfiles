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

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

if has('gui_running')
    " :set guifont=Inconsolata\ Medium\ 12
    :set guifont=Terminus\ Regular\ 12
    " :set guioptions-=m  "remove menu bar  might as well run vim...
    :set guioptions-=T  "remove toolbar
    :set guioptions-=r  "remove right-hand scroll bar
    :set guioptions-=R  "remove right-hand scroll bar
endif
colorscheme jellybeans
syntax on
"filetype plugin indent on       " load filetype plugins and indent settings
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
    set backupdir=~/.vim/backups//
endif
if exists("&directory")
    set directory=~/.vim/swaps//
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
let vundle_readme=expand('~/.vim/bundle/neobundle.vim/README.md')
if !filereadable(vundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    "#silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    let vundleAvail=0
endif
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc('~/.vim/bundle/')


" Repos on github
" addons manager
"Bundle 'gmarik/vundle'
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
"Search github
"NeoBundle 'gmarik/github-search.vim'
"Ricer tier status line that is actually useful
NeoBundle 'bling/vim-airline'
NeoBundle 'bling/vim-bufferline'
"makes moving around the file much easier
NeoBundle 'Lokaltog/vim-easymotion'
"comment out lines
"NeoBundle 'tpope/vim-commentary'
"Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML
"tags, and more. The plugin provides mappings to easily delete, change and add
"such surroundings in pairs.
NeoBundle 'tpope/vim-surround'
"Allows the use of the operator . to plugin commands
NeoBundle 'tpope/vim-repeat'
"Git wrapper
NeoBundle 'tpope/vim-fugitive'
" grep replacement
NeoBundle 'mileszs/ack.vim'
"might actually try the ack replacement! install: silversearcher-ag
"NeoBundle 'rking/ag.vim'
" Syntax checker
NeoBundle 'scrooloose/syntastic'
" Displays the filesystem
NeoBundle 'scrooloose/nerdtree'
" Shows relative numbers instead of the absolute number
NeoBundle 'myusuf3/numbers.vim'
" Inserts a closing ) } ' "
NeoBundle 'Townk/vim-autoclose'
" Headlights adds a menu to Vim, revealing your bundles (aka. plugins) and the
" features they provide.
NeoBundle 'mbadran/headlights'
" Paste code to Gist
"NeoBundle 'mattn/gist-vim'
"This Vim plugin will pull C++ ptototypes into the implementation file
NeoBundle 'derekwyatt/vim-protodef'
"This Vim plugin will help switching between companion files (e.g. .h and
".cpp files) "
NeoBundle 'derekwyatt/vim-fswitch'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
"NeoBundle 'kien/ctrlp.vim'
" Lisp plugins
" NeoBundle 'kovisoft/slimv'
NeoBundle 'kien/rainbow_parentheses.vim'
" NeoBundle 'slimv.vim'
NeoBundle 'jpalardy/vim-slime'
"source code browser
NeoBundle 'majutsushi/tagbar'

"Auto-completion
"NeoBundle 'Valloric/YouCompleteMe'
"test these
"remember to switch to branch meu !!
"NeoBundle 'zero808/c.vim'
"doxygen support
NeoBundle 'doxygen-support.vim'
"Latex support
NeoBundle 'latex-support.vim'



if vundleAvail == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" utility functions
function CreateTags()
    let curNodePath = g:NERDTreeFileNode.GetSelected().path.str()
    exec ':!ctags -R --languages=c -f ' . curNodePath . '/tags ' . curNodePath
endfunction
nmap <silent> <F4> :call CreateTags()<CR>


"--------  PLUGINS CONFIG -------------------------------------
"Syntasitc
" For C++
let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 1
"For C
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_c_compiler_options = '-std=c99' "default for gcc is gnu90
let g:syntastic_c_no_include_search = 1
let g:syntastic_c_check_header = 1

"YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"Neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

"neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"slime.vim
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
xmap <leader>s <Plug>SlimeRegionSend
nmap <leader>s <Plug>SlimeMotionSend
"this way we can have repl on the left and vim on the right
let g:slime_default_config = {"socket_name": "default", "target_pane": "1.0"}
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
if executable('ag')
" " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
  let g:ackprg = "ag --nocolor --nogroup --column"
"   " Use ag in CtrlP for listing files. Lightning fast and respects
"   .gitignore
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
elseif executable('ack-grep')
" set grepprg=ack-grep
  let g:ackprg = "ack-grep --nocolor --nogroup --column"
elseif executable('ack')
" set grepprg=ack
  let g:ackprg = "ack --nocolor --nogroup --column"
endif

"Latex-suite
"let g:tex_flavor='latex'
"--------------------------------------------------------------

filetype plugin indent on       " load filetype plugins and indent settings
endif " version >= 500
