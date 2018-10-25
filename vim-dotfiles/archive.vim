"------------------------------------------------------------------------------
" dein
"------------------------------------------------------------------------------

 if &compatible
     set nocompatible
 endif
 
 let s:dein_dir = expand('~/.cache/dein')
 let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
 
 " dein installation check
 if &runtimepath !~# '/dein.vim'
     if !isdirectory(s:dein_repo_dir)
         execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
     endif
     execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
 endif
 
 if dein#load_state('~/.cache/dein')
     call dein#begin('~/.cache/dein')
 
     call dein#add('~/.cache/dein')
     call dein#add('Shougo/neocomplete')
     call dein#add('Shougo/Unite.vim')
     call dein#add('Shougo/neosnippet')
     call dein#add('Shougo/neosnippet-snippets')
     call dein#add('Yggdroot/indentLine')
     call dein#add('scrooloose/nerdtree')
     call dein#add('joshdick/onedark.vim')
     call dein#add('itchyny/vim-parenmatch')
     call dein#add('kana/vim-smartinput')
     call dein#add('tpope/vim-endwise')
     call dein#add('ap/vim-css-color')
     call dein#add('mattn/emmet-vim')
 
     " Syntax checking
     if has('job') && has('channel') && has('timers')
         call dein#add('w0rp/ale')
     else
         call dein#add('vim-syntastic/syntastic')
     endif
 
     call dein#end()
     call dein#save_state()
 endif
 
 " 不足プラグインの自動インストール
 if has('vim_starting') && dein#check_install()
     call dein#install()
 endif
 
 filetype plugin indent on
 syntax enable



