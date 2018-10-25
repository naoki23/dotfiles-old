"------------------------------------------------------------------------------
" Tab
"------------------------------------------------------------------------------
set list listchars=tab:\▸\-
set autoindent          "改行時に前の行のインデントを計測
set smartindent         "改行時に入力された行の末尾に合わせて次の行のインデントを増減する 
set cindent             "Cプログラムファイルの自動インデントを始める
set smarttab            "新しい行を作った時に高度な自動インデントを行う
set expandtab           "タブ入力を複数の空白に置き換える 

set tabstop=2           "タブを含むファイルを開いた際, タブを何文字の空白に変換するか
set shiftwidth=2        "自動インデントで入る空白数
set softtabstop=0       "キーボードから入るタブの数

"------------------------------------------------------------------------------
" 隣接した{}で改行したらインデント
"------------------------------------------------------------------------------

function! IndentBraces()
    let nowletter = getline(".")[col(".")-1]    " 今いるカーソルの文字
    let beforeletter = getline(".")[col(".")-2] " 1つ前の文字

    " カーソルの位置の括弧が隣接している場合
    if nowletter == "}" && beforeletter == "{"
        return "\n\t\n\<UP>\<RIGHT>\<RIGHT>\<RIGHT>\<RIGHT>"
    else
        return "\n"
    endif
endfunction
" Enterに割り当て
inoremap <silent> <expr> <CR> IndentBraces()
"------------------------------------------------------------------------------
" 言語別のインデントの設定
"------------------------------------------------------------------------------

if has("autocmd")
    "ファイルタイプの検索を有効にする
    filetype plugin on
    "ファイルタイプに合わせたインデントを利用
    filetype indent on
    "sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
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
    autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
    autocmd FileType vim         setlocal sw=4 sts=4 ts=4 et
endif
