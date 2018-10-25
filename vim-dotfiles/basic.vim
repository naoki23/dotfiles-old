
" Basic setting ---------------------------------------------------------------

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
syntax enable

let OSTYPE = system('uname')
if OSTYPE == "Linux\n"
    set clipboard=unnamedplus
elseif OSTYPE == "Darwin\n"
    set clipboard=unnamed
endif



" Letter code -----------------------------------------------------------------

set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" Appearance ------------------------------------------------------------------

set number
" set cursorline
" hi clear Cursorline
set colorcolumn=80
" execute "set colorcolumn=" . join(range(80, 9999), ',')
set virtualedit=onemore
set visualbell
set showmatch
set wildmode=list:longest
set linespace=4
set scrolloff=2

" 空白とかを視覚化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" ステータスライン
set statusline=\ %<%F\ %m%r%h%w%=\ %n\ \|\ %Y\ \|\ %{&fileencoding}\ \|\ %P\ \ 
set laststatus=2

" Key mapping -----------------------------------------------------------------

noremap <S-h> ^
noremap <S-l> $
nnoremap == gg=G''
nnoremap <Space>n :NERDTreeToggle<CR>
nnoremap ; :
nnoremap : ;
nnoremap <Space>v <C-v>
noremap <C-v> <Nop>
inoremap <silent> jj <ESC>
let mapleader = "\<Space>"

" Serach ----------------------------------------------------------------------

set ignorecase
set wrapscan
set hlsearch

" Paste------------------------------------------------------------------------

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" Undo -----------------------------------------------------------------------

if has('persistent_undo')
    set undodir=~/.vim/undo
    set undofile
endif

