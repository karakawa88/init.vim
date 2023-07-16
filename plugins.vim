source ~/.config/nvim/plugins/plug.vim
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
" カラースキーム
" カラースキームをスクロールする
Plug 'flazz/vimcolorschemes'
" ステータスラインの見た目
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"補完
" neovimのビルトインのLSPを使用する
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
" ddc
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-ui-native'
" ポップアップのプレビューを表示するプラグイン
Plug 'matsui54/denops-popup-preview.vim'
" signature helpを表示する
Plug 'matsui54/denops-signature_help'
" ポップアップウィンドウを表示するプラグイン
Plug 'Shougo/pum.vim'
" カーソル周辺の既出単語を補完するsource
Plug 'Shougo/ddc-around'
" ファイル名を補完するsource
Plug 'LumaKernel/ddc-file'
" 入力中の単語を補完の対象にするfilter
Plug 'Shougo/ddc-matcher_head'
" 補完候補を適切にソートするfilter
Plug 'Shougo/ddc-sorter_rank'
" 補完候補の重複を防ぐためのfilter
Plug 'Shougo/ddc-converter_remove_overlap'
Plug 'Shougo/ddc-nvim-lsp'

"Telescope
" telescope.nvimが依存
Plug 'nvim-lua/plenary.nvim'
Plug 'airblade/vim-rooter'
" Search for Project root
" Find files using Telescope command-line sugar.
" nnoremap <C-p> <cmd>Telescope find_files<cr>
" nnoremap <C-g> <cmd>Telescope live_grep<cr>
" " プロジェクトルートではなく現在開いているファイルを起点にファイル検索
" nnoremap <M-p> <cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') })<cr>
" nnoremap <M-g> <cmd>lua require('telescope.builtin').live_grep( { cwd = vim.fn.expand('%:p:h') })<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" 
" " Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
Plug 'nvim-telescope/telescope.nvim'

" telescope-frequencyが依存
Plug 'tami5/sqlite.lua'

" telescope-frequencyが依存
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-telescope/telescope-frecency.nvim'
nnoremap <C-f> <cmd>Telescope frecency<cr>

" テキスト翻訳
" Googl翻訳を使用して翻訳
Plug 'skanehira/translate.vim'
" Vim
" vimのヘルプファイルの作成
Plug 'LeafCage/vimhelpgenerator'
" GUndo
" Plug 'sjl/gundo.vim'
" Git
Plug 'tpope/vim-fugitive'
" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'kana/vim-tabpagecd'
Plug 'Shougo/neoyank.vim'
" Plug 'Shougo/denite.nvim'
" Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nixprime/cpsm'
"build = 'env PY3=ON ./install.sh'
Plug 'Shougo/neosnippet'
Plug 'tpope/vim-surround'
Plug 'LeafCage/yankround.vim'
Plug 'tyru/caw.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'scrooloose/syntastic'
"Plug 'justmao945/vim-clang'
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
" HTML5 CSS
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hokaccha/vim-html5validator'
Plug  'mattn/emmet-vim'
Plug  'tyru/open-browser.vim'
Plug 'hail2u/vim-css3-syntax'
" JS
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
"Plug 'davidhalter/jedi-vim'
"Plug 'zchee/deoplete-jedi'
Plug 'vim-scripts/dbext.vim'
Plug 'majutsushi/tagbar'
Plug 'lighttiger2505/gtags.vim'
Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
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
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-clang'
"Plug 'Shougo/neoinclude.vim'
call plug#end()

