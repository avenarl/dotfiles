set nocompatible
set number
set numberwidth=5
set ruler
set noswapfile
set title
set splitright
set splitbelow
set noshowmode
syntax on
highlight Normal ctermbg=black
filetype on
filetype indent on
set title
set ignorecase
set encoding=utf8
set autoindent
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile 
set history=50
set showcmd       " display incomplete commands
set ruler         " show the cursor position all the time
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set nojoinspaces " Use one space, not two, after punctuation.
set textwidth=80 " Make it obvious where 80 characters is
set colorcolumn=+1
set signcolumn=yes
set termguicolors
set background=dark
colorscheme molokai

" Leader
let mapleader = " "

let &t_TI = ""
let &t_TE = ""

autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
autocmd FileType eruby setlocal expandtab shiftwidth=2 tabstop=2

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,zshrc.local,*/zsh/configs/* set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> ALE Linting Events                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
" let g:is_posix = 1

" let g:rehash256 = 1

call plug#begin('~/.vim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Applicable themes
Plug 'ap/vim-css-color'  " Color name highlighter

" Language Syntax Support
Plug 'pangloss/vim-javascript' " JS highlighting
Plug 'mxw/vim-jsx' " JSX syntax highlighting
Plug 'tpope/vim-rails'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Tools
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive' " Git tools
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " Nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocompletion
Plug 'luochen1990/rainbow'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'craigemery/vim-autotag'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Theme Settings                                          "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Rainbow Brackets  
let g:rainbow_active = 1

" NERDtree
" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> NERDTree                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Prettier                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autosave
" disables autosave feature
let g:prettier#autoformat = 0

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'true'

" runs prettier on file formats
autocmd BufWritePre *.html,*.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Emmet                                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_emmet_leader_key=',' " Redefine emmet leader key. It's now ,,
" let g:user_emmet_expandabbr_key='<Tab>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Fzf                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" Autopairs closing tags
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.vue,*.phtml,*.js,*.jsx,*.coffee,*.erb,*.rb,'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Airline                                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
" powerline
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Coc Config                                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> Mappings                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
vmap j gj
vmap k gk
nmap j gj
nmap k gk
vnoremap <C-c> "+y
map <C-v> "+p"
" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"Escape insert mode
 inoremap jh <Esc>
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<Space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set tags for vim-fugitive
set tags^=.git/tags

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" No arrows
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical


