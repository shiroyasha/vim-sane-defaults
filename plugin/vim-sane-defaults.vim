" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" set up default path
exe "set path=".expand("$PATH")

" Show title
set title

" Hide annoying E37: No write since last change (add ! to override)
set hidden

" Show line numbers
set number
set numberwidth=4
set ruler

" enable syntax highlighting
syntax enable

set nomodeline

" Backspace will delete EOL chars, as well as indents
set backspace=indent,eol,start

" For characters that forms pairs for using % commands, this is for HTML Tags
set matchpairs+=<:>

" To avoid the 'Hit Enter' prompts caused by the file messages
set shortmess=atToOI

" Keywords are use to searching and recognized with many commands
set iskeyword+=_,$,@,%,#

" Set default encoding to utf-8
set encoding=utf-8
set termencoding=utf-8

" Disable all bells and whistles
set noerrorbells visualbell t_vb=

" Wild menu (Autocompletion)"
set wildmenu
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.jpeg,*.png,*.xpm,*.gif
set wildmode=full

" Disable backups and swap files
set nobackup
set nowritebackup
set noswapfile

" Sane search options
set hlsearch   " Highlight search
set incsearch  " Incremental search
set magic      " Set magic on, for regular expressions
set ignorecase " Searches are Non Case-sensitive
set smartcase

" Clear search highlighting
nnoremap <silent><leader><CR> :nohl<CR>

" Sane folding defaults
set foldenable
set foldmethod=marker
set foldlevel=0
set foldcolumn=0

" Always show the statusline
set laststatus=2

" Improves redrawing for newer computers
set ttyfast
set lazyredraw         " The screen won't be redrawn unless actions took place

set showmatch          " Shows matching brackets when text indicator is over them
set scrolloff=5        " Show 5 lines of context around the cursor
set sidescrolloff=20
set scrolljump=10

" completition window height
set pumheight=10

set showcmd
set diffopt+=context:3

" Formatting Options
set wrap      " Soft Wrap in all files, while hard wrap can be allow by filetype
set linebreak " It maintains the whole words when wrapping

" Indentation
set autoindent
set cindent
set smartindent

" Tab Options
set shiftwidth=2
set tabstop=2
set expandtab

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" disable cursor keys in normal mode
map <Left>  :echo "no! use h!"<cr>
map <Down>  :echo "no! use j!"<cr>
map <Up>    :echo "no! use k!"<cr>
map <Right> :echo "no! use l!"<cr>

" edit vimrc files
nnoremap <silent><leader>1 :e ~/.vimrc<CR>
nnoremap <silent><leader>2 :source ~/.vimrc<CR>
nnoremap <silent><leader>3 :BundleInstall<CR>

" Paste mode with F3
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
  if g:paste_mode == 0
    set paste
    let g:paste_mode = 1
  else
    set nopaste
    let g:paste_mode = 0
  endif
  return
endfunc

nnoremap <silent> <F3> :call Paste_on_off()<CR>
set pastetoggle=<F3>

" Indent visual selected code without unselecting
" As seen in vimcasts.org
vmap > >gv
vmap < <gv
vmap = =gv

" set correct filetypes for various languages
au BufRead,BufNewFile *.go setlocal filetype=go
au BufRead,BufNewFile *.cap setlocal filetype=ruby
au BufRead,BufNewFile Capfile* setlocal filetype=ruby
au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.md setlocal colorcolumn=+1

au BufRead,BufNewFile *.md.erb setlocal textwidth=80
au BufRead,BufNewFile *.md.erb setlocal colorcolumn=+1

au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md.erb setlocal spell

au BufRead,BufNewFile *.feature setlocal spell

" splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

set background=dark

" Instantly leave insert mode when pressing <ESC>
" This works by disabling the mapping timeout completely in normal
" mode, and enabling it in insert mode with a very low timeout length.
augroup fastescape
  autocmd!

  set notimeout
  set ttimeout
  set timeoutlen=10

  au InsertEnter * set timeout
  au InsertLeave * set notimeout
augroup END
