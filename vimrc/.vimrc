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
set ignorecase
set encoding=utf8
set autoindent
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
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

filetype plugin indent on

call plug#begin('~/.vim/plugged')

" Themes
Plug 'flazz/vim-colorschemes'

" Language Syntax Support
Plug 'pangloss/vim-javascript' " JS highlighting
Plug 'mxw/vim-jsx' " JSX syntax highlighting
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Tools
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'} " Nerdtree
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'mustache/vim-mustache-handlebars'
Plug 'airblade/vim-gitgutter'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --> NERDTree                                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 1

let g:ctrlp_cache_dir = $HOME.'/.tmp/ctrlp'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
      \ 'file': '\.exe$\|\.so$\|\.dat$'
      \ }
let g:ctrlp_max_height = 30

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

" NERDtree
noremap <Leader>n  :NERDTreeToggle<CR>

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

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

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
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
nnoremap <Left> <NOP>
nnoremap <Right> <NOP>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

" File Tabs experience
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" file operations
nmap <C-s> :w<CR>
nmap <C-q> :q<CR>

" opens a new empty buffer
nmap <leader>t :enew<CR>
" moves to the next buffer
nmap <leader>l :bnext<CR>
" moves to the previous buffer
nmap <leader>h :bprevious<CR>
" closes the current buffer, moves to the previous one
nmap <leader>bd :bd<CR>
" forces buffer close
nmap <leader>BD :bd!<CR>
" shows all open buffers and their status
nmap <leader>bl :ls<CR>
