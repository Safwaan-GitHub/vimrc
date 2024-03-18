" {{{ BASIC SETUP
" BASIC SETUP:
" To install polyglot and use these below follow these steps
" 1) mkdir -p ~/.vim/pack/plugins/start
" 2) git clone --depth 1 https://github.com/sheerun/vim-polyglot.git ~/.vim/pack/plugins/start/vim-polyglot
" 3) curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 4) call plug#begin('~/.vim/plugged')
"Plug 'sheerun/vim-polyglot'
"call plug#end()
"5) go into vim and type :PlugInstall
"
"All done :)

set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
call plug#end()

set tabstop=8      " Default tab width
set shiftwidth=0   " Use 'tabstop' value
set noexpandtab    " Use actual tab characters, not spaces
set softtabstop=0  " Use 'tabstop' value

set smartindent
"set number

" enter the current millenium

" enable syntax and plugins (for netrw)
"syntax enable
"syntax on
"colorscheme elflord
"filetype plugin on

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)

" BUILD INTEGRATION:

" Steal Mr. Bradley's formatter & add it to our spec_helper
" http://philipbradley.net/rspec-into-vim-with-quickfix

" Configure the `make` command to run RSpec
set makeprg=bundle\ exec\ rspec\ -f\ QuickfixFormatter

" NOW WE CAN:
" - Run :make to run RSpec
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back
