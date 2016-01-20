if 0 | endif

set nocompatible

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage itself, required
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'gmarik/Vundle.vim'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-haml'
NeoBundle 'tpope/vim-abolish.git',
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'vim-scripts/scratch.vim'
NeoBundle 'vim-scripts/EasyGrep'
NeoBundle 'camelcasemotion'
NeoBundle 'sjl/badwolf'
NeoBundle 'skalnik/vim-vroom'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'benmills/vimux'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'jceb/vim-orgmode'
NeoBundle 'majutsushi/tagbar.git'
NeoBundle 'vim-erlang/vim-erlang-runtime'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim', {'autoload':{'unite_sources':'file_mru'}}
NeoBundle 'Shougo/vimproc.vim.git',
  \ { 'directory': 'vimproc',
  \   'build': {
  \     'mac':  'make -f make_mac.mak',
  \     'unix': 'make -f make_unix.mak'
  \    },
  \ }
if has('python')
NeoBundle 'Valloric/YouCompleteMe',
  \ {
  \  'vim_version': '7.3.584',
  \  'build': {
  \    'mac': './install.sh',
  \    'unix': './install.sh'
  \  }
  \ }
endif

" All of your Plugins must be added before the following line
call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" Set color scheme
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal" || $COLORTERM == "xfce4-terminal"
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
set noerrorbells
set novisualbell
set t_vb=

" Setup status line
set statusline=[%t]
set statusline+=%*
set statusline+=%{fugitive#statusline()}
set statusline+=%*
set statusline+=%c,
set statusline+=%l/%L
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
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

" Simplify split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Bind Ctrl-PageUp/PageDown to move next/previous tabs
nmap <silent> <C-PageDown> gt
nmap <silent> <C-PageUp> gT

" Markdown highlighting
augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END

" Turn on spell check for certain file types
set complete+=kspell
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_us
autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell spelllang=en_us

" Set ant as java compiler
autocmd BufRead *.java compiler ant
autocmd BufRead set makeprg=ant\ -find\ build.xml

" Autowrap text to 80 chars for certain filetypes
autocmd FileType gitcommit setlocal textwidth=80

" Allow saving with sudo
cmap W!! w !sudo tee % >/dev/null

" Toggle paste mode
nmap <leader>o :set paste!<CR>

" Indent guides settings
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'calendar']

" Set Syntastic checkers
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_java_checkers = ['javac']
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_haml_checkers = ['haml']
let g:syntastic_json_checkers = ['jsonlint']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Vroom
let g:vroom_use_vimux = 1

" Set CtrlP settings
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.png,*.jpg,*.pdf,*.swf
let g:ctrlp_custom_ignore = '\.git$\|\.o$\|\.app$\|\.csv\|\.class$\|tags\|public\/images$\|public\/uploads$\|log\|tmp$\|source_maps\/\|app\/assets\/images\|test\/reports\|node_modules\|bower_components\|dist\/\|bin\/\|gen\/'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:50,results:50'
nnoremap <leader>tp :CtrlPTag<cr>

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

runtime macros/matchit.vim

" Set Nerdtree bindings
nmap <silent> <Leader>nt :NERDTreeToggle<CR>
nmap <silent> <Leader>nf :NERDTreeFind<CR>
let g:NERDTreeDirArrows=0

" Set Tagbar bindings
nmap <silent> <Leader>tb :TagbarToggle<CR>

" Quick fix bindings
nmap <silent> <Leader>co :copen<CR>
nmap <silent> <Leader>cc :cclose<CR>
nmap <silent> <Leader>cn :cnext<CR>
nmap <silent> <Leader>cp :cprev<CR>

" vim-fugitive bindings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>

" Perl-like regex syntax by default
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
nnoremap :s/ :s/\v

" Catch trailing whitespace
nmap <silent> <leader>s :set nolist!<CR>
set list listchars=tab:>-,trail:.,extends:#,nbsp:.

nnoremap <silent> <leader><space> :call TrimSpaces()<CR>

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

function! TrimSpaces()
  %s/\s*$//
  ''
endfunction

" Start in insert mode
let g:unite_enable_start_insert = 1

" Enable history yank source
let g:unite_source_history_yank_enable = 1

" Open in bottom right
let g:unite_split_rule = "botright"

" Shorten the default update date of 500ms
let g:unite_update_time = 500

let g:unite_source_file_mru_limit = 300
let g:unite_cursor_line_highlight = 'TabLineSel'

let g:unite_source_file_mru_filename_format = ':~:.'
let g:unite_source_file_mru_time_format = ''

let g:unite_source_grep_max_candidates = 200

" Set up some custom ignores
call unite#custom#source('buffer,file,file_rec/neovim,file_rec/git,file_rec,file_mru,file',
  \ 'ignore_pattern',
  \ '\.o$\|\.app$\|\.csv\|\.class$\|tmp$\|dist\/\|bin\/\|gen\/')

let g:unite_source_file_rec_max_cache_files = 0
let g:unite_source_rec_max_cache_files = 0

let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts =
        \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''tags'' ' .
        \ '--ignore ''source_maps'' --ignore ''node_modules'' --ignore ' .
        \ '''bower_components'' --ignore ''.bzr'' --ignore ''**/*.pyc'''
  let g:unite_source_grep_recursive_opt=''
  let g:unite_source_grep_search_word_highlight = 'TabLineSel'
  let g:unite_source_rec_neovim_command = ['ag --follow --nocolor --nogroup --hidden ' .
        \ '--ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''tags'' ' .
        \ '--ignore ''source_maps'' --ignore ''node_modules'' --ignore ' .
        \ '''bower_components'' --ignore ''.bzr'' --ignore ''**/*.pyc'' -g ""']
  let g:unite_source_grep_command = 'ag'
endif

call unite#custom#source('file_rec/neovim,file_rec/git', 'ignore_globs', [])

call unite#custom#source('file_rec,file_rec/neovim,file_rec/git', 'max_candidates', 1000)
call unite#custom#profile('files', 'filters', 'sorter_rank')

call unite#custom#source(
      \ 'buffer,file_rec', 'matchers',
      \ ['converter_relative_word', 'matcher_fuzzy', 'matcher_project_ignore_files'])
call unite#custom#source('file_rec/neovim,file_rec/git', 'matchers',
      \  [ 'converter_relative_word', 'matcher_default' ])
call unite#custom#source(
      \ 'file_rec,file_rec/neovim,file_rec/git,file_mru', 'converters',
      \ ['converter_file_directory'])
call unite#custom#source('file_rec,file_rec/neovim', 'required_pattern_length', 1)

call unite#custom#source('file_rec', 'sorters', 'sorter_length')

" Use <space> as Unite's 'leader' key
nnoremap [unite] <Nop>
nmap <space> [unite]

function! s:ExtractGitProject()
  let b:git_dir = finddir('.git', ';')
  return b:git_dir
endfunction

function! UniteGetSource()
  " If inside git dir, do file_rec/git, else file_rec/neovim
  if exists('b:git_dir') && (b:git_dir ==# '' || b:git_dir =~# '/$')
    unlet b:git_dir
  endif

  if !exists('b:git_dir')
    let dir = s:ExtractGitProject()
    if dir !=# ''
      let b:git_dir = dir
    endif
  endif
  echo b:git_dir
  return b:git_dir !=# '' ? "file_rec/git" : "file_rec/neovim:!"
endfunction

" General fuzzy search
nnoremap <silent> [unite]<space> :execute "Unite -no-split -no-empty -start-insert -buffer-name=files buffer " UniteGetSource()<CR>

" Quick registers
nnoremap <silent> [unite]r :<C-u>Unite -no-split -buffer-name=register register<CR>

" Quick buffer and mru
nnoremap <silent> [unite]b :<C-u>Unite -no-split -buffer-name=buffers buffer file_mru<CR>

" Quick sources
nnoremap <silent> [unite]a :<C-u>Unite -no-split -buffer-name=sources source<CR>

" Quickly switch lcd
nnoremap <silent> [unite]d :<C-u>Unite -buffer-name=change-cwd -default-action=lcd directory_mru<CR>

" Quick file search
nnoremap <silent> [unite]f :<C-u>Unite -buffer-name=files file_rec/neovim:! file/new<CR>

" Quick grep from cwd
nnoremap <silent> [unite]g :<C-u>Unite -winwidth=150 grep:%::<CR>
nnoremap <silent> [unite]G :<C-u>Unite -buffer-name=search -auto-preview -no-quit -no-empty grep:.::<CR>

" Quick line using the word under cursor
nnoremap <silent> [unite]l :<C-u>Unite -buffer-name=search_file line<CR>
nnoremap <silent> [unite]L :<C-u>UniteWithCursorWord -buffer-name=search_file line<CR>

" Quick MRU search
nnoremap <silent> [unite]m :<C-u>Unite -buffer-name=mru file_mru<CR>

" Quick find
nnoremap <silent> [unite]s :<C-u>Unite -buffer-name=find find:.<CR>

" Quick commands
nnoremap <silent> [unite]c :<C-u>Unite -buffer-name=commands command<CR>

" Fuzzy search from current buffer
nnoremap <silent> [unite]x :<C-u>UniteWithBufferDir -no-split -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
