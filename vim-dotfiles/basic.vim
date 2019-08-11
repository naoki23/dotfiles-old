" Basic setting ---------------------------------------------------------------

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
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
set colorcolumn=80
set virtualedit=onemore
set visualbell
set showmatch
set wildmode=list:longest
set linespace=4
set scrolloff=2

" invisible letter
set list
set listchars=tab:»-,trail:-,nbsp:%
hi ZenkakuSpace term=underline ctermbg=10 guibg=#ff9900
match ZenkakuSpace /　/
hi SpecialKey guifg=#ff9900

" Statusline -----------------------------------------------------------------

function! Statusline()
    if mode() == 'n'
        let mode_name = "Normal"
        let color_num = 1
    elseif mode() == "i"
        let mode_name = "Insert"
        let color_num = 2
    elseif mode() == "R"
        let mode_name = "Replace"
        let color_num = 3
    else
        let mode_name = "Visual"
        let color_num = 4
    endif

    if winwidth(0) >= 100
        let file_type = 'F'
    else
        let file_type = 't'
    endif

    return '%'.color_num.'*  '.mode_name.'  %*%5*  %<%'.file_type.'  %* %m%r%h%w%= %n | %{&fileformat} | %{&filetype} | %{&fileencoding} %6* %P %*%7*  %c/%l  %*'

endfunction

set statusline=%!Statusline()
set laststatus=2

hi User1 gui=bold guibg=#afdf00 guifg=#000000
hi User2 gui=bold guibg=#61afef guifg=#ffffff
hi User3 gui=bold guibg=#e06c75 guifg=#000000
hi User4 gui=bold guibg=#eea9bf guifg=#000000
hi User5 gui=bold guibg=#4C4C4C guifg=#E7E8E2
hi User6 gui=bold guibg=#4C4C4C guifg=#E7E8E2
hi User7 gui=bold guibg=#E7E8E2 guifg=#4C4C4C

" Key mapping -----------------------------------------------------------------

noremap <S-h> ^
noremap <S-l> $
nnoremap == gg=G''
nnoremap <Space>n :NERDTreeToggle<CR>
nnoremap ; :
nnoremap : ;
nnoremap <Space>v <C-v>
nnoremap <C-v> <Nop>
inoremap <silent>jj <ESC>
"inoremap [ []<left>
"inoremap ] <right>
"inoremap { {}<left>
"inoremap } <right>
"inoremap ( ()<left>
"inoremap ) <right>
"inoremap ' ''<left>
"inoremap " ""<left>
if mode() == 'n'
    let mapleader = "\<Space>"
endif
"let g:user_emmet_leader_key='<space>' " Emmet-vim でトリガーをspaceに

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

