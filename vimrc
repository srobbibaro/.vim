set nocompatible

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'slim-template/vim-slim'
Plugin 'pangloss/vim-javascript'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/scratch.vim'
Plugin 'camelcasemotion'
Plugin 'sjl/badwolf'
Plugin 'skalnik/vim-vroom'
Plugin 'FelikZ/ctrlp-py-matcher'
if version >= 73584
  Plugin 'Valloric/YouCompleteMe'
endif

" All of your Plugins must be added before the following line
call vundle#end()

" Set color scheme
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif
syntax enable
colorscheme badwolf

" Font settings
if has("gui_running")
  if has("gui_win32")
    set guifont=Bitstream_Vera_Sans_Mono:h16:cANSI
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h13
  else
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif
endif

" Change location of backup directory
set noswapfile
set nobackup
set backupdir=~/tmp
set dir=~/tmp,/tmp

" Set session.vim settings
let g:session_autosave = "no"
let g:session_autoload = "no"

" General settings
set number
set ruler
set ignorecase
set smartcase
set hidden
set autoread
set scrolloff=3
set mouse=a
set laststatus=2

" File type detection and indenting
filetype off
syntax on
filetype plugin indent on

" Fold settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Set tabs to 2 spaces, soft
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab

" Show indicator for 80 charaters in a column
let &colorcolumn=80

" Set leader key
let mapleader = ","

" Yank to platform clipboard
map <leader>y "*y

" Change working directory to current file
map <Leader>cd :cd %:p:h<CR>

" Search highlight toggle
nnoremap <F2> :set hlsearch!<CR>

" Check spelling toggle
nnoremap <F9> :set spell!<CR>

" Bind Ctrl-PageUp/PageDown to move next/previous tabs
nmap <silent> <C-PageDown> gt
nmap <silent> <C-PageUp> gT

" Markdown highlighting
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

" Turn on spell check for certain file types
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Autowrap text to 80 chars for certain filetypes
autocmd FileType gitcommit setlocal textwidth=80

" Allow saving with sudo
cmap w!! w !sudo tee % >/dev/null

" Toggle paste mode
nmap <leader>o :set paste!<CR>

" Indent guides settings
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'calendar']

" Set Syntastic ruby settings
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Set CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
if has('python')
  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
let g:ctrlp_custom_ignore = '\.git$\|\.o$\|\.app$\|\.csv\|tags\|public\/images$\|public\/uploads$\|log\|tmp$\|source_maps\|app\/assets\/images\|test\/reports\|node_modules\|bower_components\|dist'
" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0

runtime macros/matchit.vim

" Set Nerdtree bindings
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nmap <silent> <Leader>ntf :NERDTreeFind<CR>

" Catch trailing whitespace
nmap <silent> <leader>s :set nolist!<CR>
set list listchars=tab:>-,trail:.,extends:#,nbsp:.

nnoremap <silent> <leader><space> :call TrimSpaces()<CR>

function! TrimSpaces()
  %s/\s*$//
  ''
endfunction
