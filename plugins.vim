source ~/.config/nvim/plugin/plug.vim
call plug#begin()
" vim-plugのhelpを見れるようにする
Plug 'junegunn/vim-plug'
" neovimのhelpを日本語化する
Plug 'vim-jp/vimdoc-ja'
" vim-unimpaired vimに便利なキーマップを追加する
" バッファを移動する
" [b 前のバッファに戻る
" ]b 次のバッファに移動する
" yocでカーソル行のハイライトをトグルできる
Plug 'tpope/vim-unimpaired'
" ディレクトリのファイルツリーを表示する
" :NERDTreeで現在のディレクトリを新しく作成したバッファに表示
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
" vim-devicons ファイルタイプごとにアイコンを表示するプラグイン
Plug 'ryanoasis/vim-devicons'
" ack-grep
Plug 'mileszs/ack.vim'
" easy-motion
Plug 'easymotion/vim-easymotion'
Plug 'kana/vim-tabpagecd'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
" Plug 'Shougo/denite.nvim'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nixprime/cpsm'
"build = 'env PY3=ON ./install.sh'
Plug 'Shougo/neosnippet'
Plug 'tpope/vim-surround'
Plug 'LeafCage/yankround.vim'
Plug 'tyru/caw.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/syntastic'
Plug 'justmao945/vim-clang'
Plug 'Shougo/neoinclude.vim'
Plug 'osyo-manga/shabadou.vim'
Plug 'osyo-manga/vim-watchdogs'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-jabraces'
Plug 'kana/vim-textobj-lastpat'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-datetime'
Plug 'kana/vim-textobj-syntax'
Plug 'thinca/vim-textobj-between'
Plug 'thinca/vim-textobj-comment'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'gilligan/textobj-lastpaste'
Plug 'deton/textobj-mbboundary.vim'
Plug 'akiyan/vim-textobj-xml-attribute'
Plug 'saihoooooooo/vim-textobj-space'
Plug 'mattn/vim-textobj-url'
Plug 'h1mesuke/textobj-wiw'
Plug 'rhysd/vim-textobj-lastinserted'
Plug 'rhysd/vim-textobj-continuous-line'
Plug 'hchbaw/textobj-motionmotion.vim'
Plug 'deris/vim-textobj-headwordofline'
Plug 'rbonvall/vim-textobj-latex'
Plug 'sgur/vim-textobj-parameter'
Plug 'mattn/vim-textobj-cell'
Plug 'osyo-manga/vim-textobj-context'
Plug 'osyo-manga/vim-textobj-multiblock'
Plug 'glts/vim-textobj-indblock'
Plug 'RyanMcG/vim-textobj-dash'
Plug 'bps/vim-textobj-python'
Plug 'othree/html5.vim'
Plug 'hokaccha/vim-html5validator'
Plug  'mattn/emmet-vim'
Plug  'tyru/open-browser.vim'
Plug 'hail2u/vim-css3-syntax'
Plug  'jelera/vim-javascript-syntax'
Plug  'othree/yajs.vim'
" Plug 'neomake/neomake'
" on_path = '.*'
Plug  'mattn/jscomplete-vim'
Plug  'ternjs/tern_for_vim'
Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'cocopon/vaffle.vim'
Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'
Plug 'vim-scripts/dbext.vim'
Plug 'majutsushi/tagbar'
Plug 'lighttiger2505/gtags.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-scripts/a.vim'
"Plug 'vim-latex/vim-latex'
Plug 'lervag/vimtex'
Plug 'w0rp/ale'
" on_cmd = ['ALELint', 'ALEToggle', 'ALEEnable', 'ALEToggleBuffer', 'ALEEnableBuffer']
Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-unimpaired'
Plug 'lervag/vimtex'
"YouCompleteMeはコンパイルに時間がかかるためタイムアウトを伸ばす
" let g:plug_timeout=300
" Plug 'ycmcore/YouCompleteMe'
Plug 'sjl/gundo.vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-clang'
Plug 'Shougo/neoinclude.vim'
call plug#end()

let g:ycm_global_ycm_extra_conf = '${HOME}/.config/nvim/.ycm_extra_conf.py'
let g:ycm_auto_trigger = 1
let g:ycm_min_num_of_chars_for_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<Down>']
set splitbelow

