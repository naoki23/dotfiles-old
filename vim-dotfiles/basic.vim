
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

" Statusline -----------------------------------------------------------------

function! Statusline_mode_name()
    if mode() =~ 'n'
        let mode_name = "Normal"
        let c = 1
    elseif mode() =~ "i"
        let mode_name = "Insert"
        let c = 2
    elseif mode() =~ "R"
        let mode_name = "Replace"
        let c = 3
    else
        let mode_name = "Visual"
        let c = 4
    endif
    return '%'. c .'* '. mode_name .' %* %<%f %m%r%h%w%= %n | %{&fileformat} | %{&filetype} | %{&fileencoding} %6* %P %* '
endfunction

hi User1 gui=bold guibg=#afdf00 guifg=#000000
hi User2 gui=bold guibg=#61afef guifg=#000000
hi User3 gui=bold guibg=#e06c75 guifg=#000000
hi User4 gui=bold guibg=#eea9bf guifg=#000000
hi User5 gui=bold guibg=#262626 guifg=#ffffff
hi User5 gui=bold guibg=#abb2bf guifg=#E7E8E2
hi User6 gui=bold guibg=#E7E8E2 guifg=#4C4C4C

" 左
"set statusline=%!Statusline_mode_name()\ %<%F\ %m%r%h%w%=
" 右
"set statusline+=\ %n\ \|\ %{&fileformat}\ \|\ %{&filetype}\ \|\ %{&fileencoding}\ \|\ %P\' 

set statusline=%!Statusline_mode_name()
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
inoremap [ []<left>
inoremap ] <right>
inoremap { {}<left>
inoremap } <right>
inoremap ( ()<left>
inoremap ) <right>
inoremap ' ''<left>
inoremap " ""<left>
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

