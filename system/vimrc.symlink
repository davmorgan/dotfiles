if has('vim_starting')
	set nocompatible
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required Setup
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'

" Install Bundles
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'genoma/vim-netrw'
NeoBundle 'Shougo/vimshell'
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'dagwieers/asciidoc-vim'
NeoBundle 'rodjek/vim-puppet'
NeoBundle 'godlygeek/tabular'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'honza/vim-snippets'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'Blackrush/vim-gocode'
NeoBundle 'chase/vim-ansible-yaml'
NeoBundle 'itspriddle/vim-marked'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'ngmy/vim-rubocop'
NeoBundle 'mileszs/ack.vim'

" Required
call neobundle#end()

" Required
filetype plugin indent on

" Check If We Need Any Bundles
NeoBundleCheck

" Basic Configuration
syntax on
set t_Co=256
set autoread
set mouse=a
set mousehide
set history=1000
colorscheme jellybeans

" Encoding
set encoding=utf8
set ffs=unix,dos,mac

" Easier Saving
let mapleader = ","
let g:mapleader = ","
nnoremap ; :
nmap <leader>w :w!<cr>
cmap w!! w !sudo tee % >/dev/null

" Tabularize Quicker
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
  nmap <Leader>ab :Tabularize /=><CR>
  vmap <Leader>ab :Tabularize /=><CR>
  nmap <Leader>a' :Tabularize '=<CR>
  vmap <Leader>a' :Tabularize '=<CR>
endif

" Tab Config
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Indent Settings
set autoindent
set smartindent
set copyindent

" Match Braces
runtime macros/matchit.vim

" Editor Configs
set hidden
set nowrap
set number
set shiftround
set showmatch
set ruler

" Whitespace
set backspace=eol,start,indent
set so=7
set wildmode=longest:full
set wildignore=*.o,*~,*.pyc,*.DS_Store
set wildmenu
set lazyredraw
set magic
set title

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch

" No Alarms
set noerrorbells
set novisualbell
set t_vB=
set tm=500

set cursorline

" Move Between Windows
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Format GoCode on Save
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Autogenerate ctags on save
autocmd BufWritePost *.go silent! !ctags -R &

" Recognize Markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
if has('statusline')
  set laststatus=2

  " Broken down into easily includeable segments
  set statusline=%<%f\                     " Filename
  set statusline+=%w%h%m%r                 " Options
  set statusline+=%{fugitive#statusline()} " Git Hotness
  set statusline+=\ [%{&ff}/%Y]            " Filetype
  set statusline+=\ [%{getcwd()}]          " Current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Change directory to the current buffer when opening files.
set autochdir

autocmd BufWrite * :call DeleteTrailingWS()

" Allow Editing of MYVIMRC
autocmd bufwritepost .vimrc source $MYVIMRC

" Pull In Customization Options
source $HOME/.vimrc.local
