"------------------------------------------------------------------------------
" Tab
"------------------------------------------------------------------------------
set autoindent          
set smartindent         
set cindent             
set smarttab            
set expandtab           

set tabstop=2           
set shiftwidth=2        
set softtabstop=0       
set breakindent

"------------------------------------------------------------------------------
" Indent when break in adjacent {}
"------------------------------------------------------------------------------
function! IndentBraces()
    let nowletter = getline(".")[col(".")-1]    " The Char of the cursor which is now
    let beforeletter = getline(".")[col(".")-2] " Previous char

    if nowletter == "}" && beforeletter == "{"
        return "\n\t\n\<UP>\<RIGHT>\<RIGHT>\<RIGHT>\<RIGHT>"
    else
        return "\n"
    endif
endfunction
" Map Enter
inoremap <silent> <expr> <CR> IndentBraces()

"------------------------------------------------------------------------------
" Tab width by language
"------------------------------------------------------------------------------
if has("autocmd")
    "Enable to search file type
    filetype plugin on
    "Enable indent depending on file type
    filetype indent on
    "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
    autocmd FileType c           setlocal sw=4 sts=4 ts=4 et
    autocmd FileType cpp         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType html        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
    autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
    autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
    autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
    autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
    autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 et
    autocmd FileType vim         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType asm         setlocal sw=4 sts=4 ts=4 et
    autocmd FileType make        setlocal sw=4 sts=4 ts=4
endif

"------------------------------------------------------------------------------
" Python
"------------------------------------------------------------------------------
"autocmd FileType python inoremap 
