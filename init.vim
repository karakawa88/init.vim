"--------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" env
".configディレクトリー
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
" python3の実行ファイルのパス
let g:python3_host_prog = expand('/usr/local/python/bin/python3')
let g:python_host_prog = expand('/usr/local/bin/python2')


" <leader>キーの変更
" \ からスペースキーに切り替える
" mapleaderはspaceのような特殊キーを受け付けないため \<space>とする
" また''はただの文字列でそうしたくない場合(展開など)は""を使用する。
let mapleader = "\<space>"

" Required:
" ファイルタイプに基づいたインデントを有効にする
filetype plugin indent on
" シンタックスハイライトを有効にする
syntax on

"端末の設定
set t_Co=256
" カーソルの設定
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI = "\e[2 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI = "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR = "\e[4 q"
endif

"文字コード
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8
"set fileencodings=utf-8,iso-2022-jp,shift-jis,euc-jp

" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" 改行コードの自動認識
set fileformats=unix,dos,mac
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start
" デフォルトのプラグインのパス
set runtimepath+=~/.config/nvim/plugin/
set runtimepath+=/opt/local/share/nvim/runtime/
set runtimepath+=~/.config/nvim/lua/

" キー入力
" timeoutlen
" vlというキーマップがあるとしてvが押されたら次のlを押されるのに待つ時間。
" ttimeoutlen
" [esc]などのキーが次のキー入力を待つ時間
" ここに-1を設定してあるとtimeoutlenの値が使われる timeoutlenが1000なら1秒待つ。デフォルトの設定。
" set timeout timeoutlen=1000 ttimeoutlen=50
set timeout 
set timeoutlen=1000
set ttimeoutlen=50

"----------------------------------------------------
" 編集
"----------------------------------------------------
" vimのヤンクでクリップボードにコピーする
" autoselectを指定するとビジュアルモードで選択した範囲が無名レジスタにコピーされる。
" そのためビジュアルモードで文字列を選択してpで選択範囲を
" コピーまたは削除した文字列(無名レジスタに格納されている文字列)を置換する操作が実行できない。
" set clipboard+=unnamed,autoselect
set clipboard+=unnamed
" vim数値編集コマンド 加算 C-a 減算 C-x コマンドを使用するとき
" 0007を認識する時10進数でなく8進数で認識する
" これを10進数にする
set nrformats=

"----------------------------------------------------
" 折り畳み
"---------------------------------------------------
set foldmethod=indent
" 折り畳みを可視化する
set foldcolumn=2
" 読み込まれた段階では折りたたみはしない
autocmd BufRead * normal zR

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイル
" スワップファイルを作るディレクトリ
set directory=~/.cache/swap
" スワップファイルの無効化
" set noswapfile
" crontabで編集できるようにする
set backupskip=/tmp/*,/private/tmp/*

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使わない
set noincsearch
" 前回の検索にマッチする単語の数を表示する
" nnoremap <silent> <leader>c :%s///gn<cr>
" インクリメンタルサーチを有効にする
nnoremap <silent> <leader>i :set incsearch!<cr>
" インクリメンタルサーチを無効にする
" nnoremap <silent> <leader>n :set noincsearch<cr>
" 検索結果文字列のハイライトを有効にする
" :nohでハイライトを消せ
" set nohlsearch
set hlsearch
" 検索結果文字列のハイライトを無効にするキーマップ
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
" nnoremap <silent> <leader>h  :noh<cr>
" nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
" ビジュアルで選択された文字列で検索を可能にする。
" ビジュアルで選択されていれば*と#で検索できる。
" source ~/.vim/plugin/visualstar.vim

"----------------------------------------------------
" grep
"----------------------------------------------------
" grepを実行するプログラムを変更する
" ack
"set grepprg=ack\ --nogroup\ --colmun $*
"set grepformat=%f:%l:%c:%m
"grepをvimのvimgrepを使用するようにする
"set grepprg=internal
" 通常のgrep
" let exclude_file=expand('~/.config/nvim/nvim_grep_exclude.txt')
" set 'rg --hidden --ignore-file='.exclude1_file.'$* 2>/dev/null'
" set grepprg=rg\ --hidden\ --glob\ .git\ $*\ 2>/dev/null
set grepprg=grep\ -RrnH\ $*\ 2>/dev/null
" set grepprg=rg\ --hidden\ --glob\ .git\ $*\ 2>/dev/null
" QuickFixに表示する一行の要素のフォーマット
set grepformat=%f:%l:%m
" vimgrep検索での除外パターン
set wildignore+=.git/**,a.out,*.o,GPATH,GRTAGS,GTAGS,ctags,tags,*.gch,__pycache__/**
" grep検索終了後QuickFixを自動的に開く設定
autocmd QuickFixCmdPost *grep* cwindow

"----------------------------------------------------
" 置換
"----------------------------------------------------
" コマンドラインモードで直前の置換コマンドを繰り返すのは:&で
" :&&で直前の置換コマンドと前の置換フラグを流用するコマンドになるが、
" 最初から置換フラグは流用させたほうがいいのでキーマップを&&を&に変更する。
nnoremap & :&&<CR>
xnoremap & :&&<CR>
" qargs.vim
" vimgrep などでQuickFixに出力されたファイルリストを元に、
" それらにコマンドを実行する。
"source ~/.vim/plugin/qargs.vim

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示しない
set number
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
"最後に実行したコマンドをステータスラインに表示する
set showcmd
" 対応する括弧のハイライト
let loaded_matchparen = 1
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
set matchtime=2
" シンタックスハイライトを有効にする
syntax on

" コメント文の色を変更
highlight Comment ctermfg=DarkCyan

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=100
" ウィンドウの幅より長い行は折り返して、次の行に続けて表示する
set wrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
"set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインの色
" highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
" terminal
set t_Co=256

"----------------------------------------------------
" インデント
"----------------------------------------------------
" タブが対応する空白の数
set tabstop=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" オートインデントを無効にする
"set noautoindent
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する ON/OFF
set smartindent
" タブ入力を複数の空白入力に置き換える ON/OFF
set expandtab
" タブを挿入するとき、代わりに空白を使わない
"set noexpandtab

"----------------------------------------------------
" バッファ
"----------------------------------------------------
" バッファ移動コマンドのキー割り当て
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" バッファを切替えてもundoの効力を失わない
" また変更したバッファをファイルに書き込まずに移動したりしても、
" 警告メッセージを出力しない。:argdoや:bufdoなどのExコマンドで有効。
" set ridden

"---------------------------------------------------
" ウィンドウ
"----------------------------------------------------
"ウィンドウを閉じずにバッファを閉じる
command! Bd :bp | :sp | :bn | :bd

"----------------------------------------------------
" ファイル
"----------------------------------------------------
" vim path設定
" ,,などの空文字列の指定は現在の作業ディレクトリーを表す
set path=.,./,,$HOME/.config/nvim
" :edit %:hでファイル名を除いたそのバッファのカレントディレクトリを補完
" してくれるがそれを%%で行うようにする。
" write, saves, readなどのExコマンドでも可能。
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" netrw ファイルエクスプローラー
" netrwを有効にする
set nocompatible 
filetype plugin on
" ファイル間の移動
" gfでのファイル移動の時、指定した拡張子を自動的に付加するように設定
set suffixesadd+=.py
" File System synchronize
if has('unix')
	set nofsync
"    set swapsync=
endif
"----------------------------------------------------
" コマンドラインモード
"----------------------------------------------------
" コマンド、検索パターンを5000個まで履歴に残す
set history=5000
" コマンドライン補完を拡張モードにする
set wildmenu
" コマンドライン補完をzsh風補完にする
" set wildmode=full
set wildmode=list:longest,full

"set wildmode=longest,list
" C-p C-nでもコマンドの履歴を辿れるがコマンドのフィルターをしてくれない
" そのため以下の設定を行う。
cnoremap <C-p> <up>
cnoremap <C-n> <down>

"----------------------------------------------------
" カーソル・移動
"----------------------------------------------------
" matchit.vim
" %コマンドの拡張
" 対となるキーワード間の移動。
" source $VIMRUNTIME/macros/matchit.vim
"runtime macros/matchit.vim
" 移動するキーとして矢印キーを禁止する
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"----------------------------------------------------
" UndoとRedo
"----------------------------------------------------
" 永続Undoを有効にする
" 永続アンドゥはセッションをまたいでUndoを記憶できる
set undofile
" これだけだと編集するファイルたびにundoファイルが作られてしまうために
" ファイルシステムが汚れる。undoファイルを一つのディレクトリにまとめる。
if !isdirectory(expand("$HOME/.cache/undodir"))
    call mkdir(expand("$HOME/.cache/undodir"),"p")
endif
set undodir=$HOME/.cache/undodir

"---------------------------------------------------
" Helpの日本語
"---------------------------------------------------
set helplang=ja,en
"---------------------------------------------------
" マウス
"---------------------------------------------------
" マウスの機能の無効化
set mouse=

"----------------------------------------------------
" 国際化関係
"----------------------------------------------------
" 文字コードの設定
" fileencodingsの設定ではencodingの値を一番最後に記述する
set encoding=utf-8
"set termencoding=utf-8
set fileencoding=utf-8
"set fileencodings=ucs-bom,euc-jp,cp932,iso-2022-jp
"set fileencodings+=,ucs-2le,ucs-2,utf-8

"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
if has("autocmd")
    " ファイルタイプ別インデント、プラグインを有効にする
    filetype plugin indent on
    " カーソル位置を記憶する
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

" init.lua
luafile ~/.config/nvim/lua/init.lua

"----------------------------------------------------
" vim-plug
"----------------------------------------------------
"vimplugがまだインストールされていなければインストールする
" if empty(glob('~/.config/nvim/plugins/plug.vim'))
"     silent !curl -fLo ~/.vim/plugin/plug.vim --create-dirs \https://raw.github.com/junegunn/vimplug/master/plug.vim
"     autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
" " set runtimepath+=/Users/kdbadev/.config/nvim/plugin/vim-plug.vim
" source ~/.config/nvim/plugins.vim
" "コンパイルに時間がかかる場合もあるためタイムアウトを伸ばす
" let g:plug_timeout=300

"------------------------------------------------------
" カラースキーム
"------------------------------------------------------
" カラースキーマを宣言する
" colorscheme murphy
set background=dark
" colorscheme PaperColor

"----------------------------------------------------
" Terminal
"----------------------------------------------------
" Terminalでのshellを設定する
set sh=zsh
" デフォルトではcommand modeにするにはC-\ C-nを押し、shellコマンドを入力する場合はi,aを入力する。
" しかしこのままでは使いづらいので<ESC>キーの入力でcommand modeに戻れるようにする。
" tnoremap <silent> <ESC> <C-\><C-n>
" tnoremap <silent> <C-c><C-i> <C-\><C-n>
tnoremap <silent> <ESC> <C-\><C-n>
" tnoremap <silent> <C-w>k :wincmd k<CR>


" ---------------------------------------------------
" Skkelton
" ---------------------------------------------------
"  日本語入力プラグイン
"  denoが必要
"----------------------------------------------------
" call skkeleton#config({ 'globalDictionaries': [['/usr/local/share/skk/dict/SKK-JISYO.L', 'euc-jp']] })
" imap <C-j> <Plug>(skkeleton-toggle)
" cmap <C-j> <Plug>(skkeleton-toggle)



" autocmd InsertLeave * :silent !/opt/homebrew/bin/im-select com.apple.keylayout.ABC
" im-select.nvim
" lua<<EOF
"     require("im_select").setup()
" EOF

set encoding=UTF-8
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

" dir-icons
" フォルダアイコンをOnにする
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
" file
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['md'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

" ↓インストールしたfont
set guifont=Ricty\ Regular\ Nerd\ Font\ Plus\ Font\ Awesome\ Plus\ Octicons\ Plus\ Pomicons\ Plus\ Font\ Logos\ (Font\ Linux):h14


"----------------------------------------------------
" タブとステータスライン
"----------------------------------------------------
" <space>t   タブを新しく作成
" nmap <leader>t  :tabnew<cr>
" ステータスラインの基本設定
"常にステータスラインを表示する（これを設定しないと隠れてしまうときがある）
set laststatus=2
"最後に実行したコマンドをステータスラインに表示する
set showcmd

" lightline
" let g:lightline = {
"      \ 'colorscheme': 'wombat',
"      \ }

" Airline
" airlineのタブを有効にする
let g:airline#extensions#tabline#enabled = 1
" C-t n,pでタブを切り替える
nmap <C-t>p <Plug>AirlineSelectPrevTab
nmap <C-t>n <Plug>AirlineSelectNextTab
" タブに番号をつける
let g:airline#extensions#tabline#buffer_idx_mode = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" PowerLineフォントを使用する
let g:airline_powerline_fonts = 1
"左側に使用されるセパレータ
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" "右側に使用されるセパレータ
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.crypt = '🔒'		"暗号化されたファイル
" let g:airline_symbols.linenr = '¶'			"行
" let g:airline_symbols.maxlinenr = '㏑'		"最大行
" " let g:airline_symbols.branch = '⭠'		"gitブランチ
" let g:airline_symbols.paste = 'ρ'			"ペーストモード
" let g:airline_symbols.spell = 'Ꞩ'			"スペルチェック
" let g:airline_symbols.notexists = '∄'		"gitで管理されていない場合
" let g:airline_symbols.whitespace = 'Ξ'	"空白の警告(余分な空白など)
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let gairline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme = 'papercolor'
" airline aleの設定
let g:airline#extensions#ale#enabled = 1

" 挿入モードからEscでノーマルモードに戻す時、少し時間がかかる場合
set ttimeoutlen=50

"----------------------------------------------------
" プログラム関連
"----------------------------------------------------
"----------------------------------------------------
" キー入力
"----------------------------------------------------
" 対応する閉じ括弧や引用符を入力する
" <esc>でInsertモードから抜けているのは真ん中にカーソルを入れるため。
" inoremap ' ''<esc>i
" inoremap " ""<esc>i
" inoremap ( ()<esc>i
" inoremap [ []<esc>i
" inoremap { {}<esc>i
"----------------------------------------------------
" シンタックスハイライト
" ---------------------------------------------------
"----------------------------------------------------
" ctags
"----------------------------------------------------
"バッファをファイルに書き込むタイミングでctagsを実行し、tagsファイルを更新する
"autocmd BufWritePost * call system(" ctags -R")
"nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
"nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" これを設定するともしカレントディレクトリにtagsがない場合は親のディレクトリを遡って
" tagsファイルを探しに行く。;が親を遡るの意味。
set tags=tags;
" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]> 
" tagbar
nmap <F8> :TagbarToggle<CR>

"----------------------------------------------------
" スペルチェック spell
"----------------------------------------------------
" スペルをチェックする言語を指定する
" cjkを追加すると日本語のスペルチェックを省きながら英単語のチェックができる。
" 英単語には日本語の単語はないから。
set spelllang=en,cjk
" 英単語には無い例えばvimの命令などを登録する辞書
"set spellfile+=~/.vim/spell/practical_vim_jargon.utf-8.add
" 英単語には無い例えばvimの命令などを登録する辞書
"set spellfile=/Users/jkdbadev/.vim/spell/practical_vim_jargon.utf-8.add
"set spellfile=/home/jkdbadev/.vim/spell/practical_vim_jargon.utf-8.add
"setlocal spellfile+=~/.vim/spell/en.utf-8.add

"----------------------------------------------------
" その他
"----------------------------------------------------
" 起動時のメッセージを表示しない
set shortmess+=I

" helpの言語の優先順位
set helplang=ja,en

" UndoとRedo
" undotree
nnoremap <F5> :UndotreeToggle<CR>

" 補完
" Coc
" 処理をステータスラインに表示
" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external pjlugins that
" provide custom statusline: lightline.vim, vim-airline
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" map  <Leader>o :CocOutline<CR>
" nmap <Leader>o :CocOutline<CR>
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



"----------------------------------------------------
" テキスト処理
"----------------------------------------------------

"----------------------------------------------------
" NeoSnippet
"----------------------------------------------------
" デフォルトで定義し使用可能なsnippet集
" NeoBundle 'Shougo/neosnippet-snippets'
" neosnippetのplaceholderの:TARGETに対応する設定
" ビジュアルモード中にC-sを押すとコマンドラインモードにPlease input snippet trigger:
" と表示されここに:TARGETがあるsnipet名を入力すると
" そのsnippetが展開されビジュアルモードで選択された文字列が:TARGETに挿入される。
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"let g:neosnippet#enable_snipmate_compatibility = 1
" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.config/nvim/neosnippets/'

"----------------------------------------------------
" ファイル関連
"----------------------------------------------------
"----------------------------------------------------
" 引数リスト
" [a ]a         引数リストの移動
nnoremap <silent> [a :next<CR>
nnoremap <silent> ]a :prev<CR>
" タグ間移動
" [t ]t         タグ間移動
nnoremap <silent> [t :tprev<CR>
nnoremap <silent> ]t :tnext<CR>
" [T ]T         タグの最初・最後
nnoremap <silent> [T :tfirst<CR>
nnoremap <silent> ]T :tlast<CR>
" QuickFix関連キーマップ再定義
" [q ]q         QuickFixの要素間の移動
nnoremap <silent> [q :cprev<CR>
nnoremap <silent> ]q :cnext<CR>
" [f ]f         QuickFixの次のファイル要素に移動
nnoremap <silent> [f :cpfile<CR>
nnoremap <silent> ]f :cnfile<CR>
" [Q ]Q         QuickFixの最初と最後の要素
nnoremap <silent> [Q :cfirst<CR>
nnoremap <silent> ]Q :clast<CR>
" [l ]l         QuickFixのリスト間移動
nnoremap <silent> [l :colder<CR>
nnoremap <silent> ]l :cnewer<CR>
" [w ]w         QuickFixを開く・閉じる
nnoremap <silent> [w :cwindow<CR>
nnoremap <silent> ]w :cclose<CR>


"----------------------------------------------------
" 編集
"----------------------------------------------------
" suround.vim
" 例えばS"コマンドで選択中の文字列に""で囲んでくれる。
" nmap ,y :YRShow<CR>
" YankRing.vim
" vim版 killring
" pで貼り付けた後C-p,C-nで履歴を辿ることができる
" , y でヤンク履歴
" http://nanasi.jp/articles/vim/yankring_vim.html
" NeoBundle 'vim-scripts/YankRing.vim' 
" nmap ,y :YRShow<CR>
" YankRing.vimは便利ではあるが副作用が多いそのためYankround.vimを使用。
" URL: http://leafcage.hateblo.jp/entry/2013/10/31/yankroundvim
" nmap p <Plug>(yankround-p)
" nmap P <Plug>(yankround-P)
" nmap gp <Plug>(yankround-gp)
" nmap gP <Plug>(yankround-gP)
" nmap <C-p> <Plug>(yankround-prev)
" nmap <C-n> <Plug>(yankround-next)

"コメント関連
"caw-vim
nmap <Leader>c <Plug>(caw:zeropos:toggle)
vmap <Leader>c <Plug>(caw:zeropos:toggle)


"----------------------------------------------------
" プログラム関連
"----------------------------------------------------
" シンタックスチェック
" ALE
" エラー行に表示するマーク
" let g:ale_sign_error = '⨉'
" let g:ale_sign_warning = '⚠'
" エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" エラー表示の列を常時表示
" let g:ale_sign_column_always = 1

" ファイルを開いたときにlint実行
" let g:ale_lint_on_enter = 1
" ファイルを保存したときにlint実行
" let g:ale_lint_on_save = 1
" 編集中のlintはしない
" let g:ale_lint_on_text_changed = 'never'

" eslint_dを利用するための設定
" if executable('eslint_d')
"     let g:ale_javascript_eslint_use_global = 1
"     let g:ale_javascript_eslint_executable = 'eslint'
" endif
" let g:ale_linters_explicit = 1
" ESLint \   'javascript': ['eslint']
"let g:ale_linters = {
"\       'javascript': ['eslint'],
"\       'tex': ['chktex'],
"\       'rust': ['cargo clippy'],
"\       'python': ['flake8'],
"\       'sh': ['shellcheck'],
"\ }
"let g:ale_tex_chktex_options = '-n 8'
"highlight ALEErrorSign ctermbg=NONE ctermfg=red
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"----------------------------------------------------
" 構文チェック
"----------------------------------------------------
" Syntastic
" let g:syntastic_python_checkers = ['pydocstyle', 'pycodestyle', 'pyflakes']
" let g:syntastic_mode_map = { 'mode': 'passive',
"                           \ 'active_filetypes': ['javascript'],
"                           \ 'passive_filetypes': ['cpp'] }
" Syntastic無効
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {'mode':'passive'}
nnoremap <F10> :SyntasticCheck<CR> :SyntasticToggleMode<CR> :w<CR>


"----------------------------------------------------
" シェルスクリプト関連
"----------------------------------------------------
" .src拡張子 関数の定義されたファイル
" これをfiletypeをshに変更。
autocmd BufNewFile,BufRead *.src  set filetype=sh

""LaTex関連
" LaTeX専用辞書ファイルの指定
autocmd FileType tex :let &l:dictionary = '~/.config/nvim/dict/tex.dict'
" BibTeX
" BibTeX用辞書ファイルの指定
autocmd FileType bib :let &l:dictionary = '~/.config/nvim/dict/bibtex.dict'

" コマンドランチャー
" URL: https://dev.classmethod.jp/articles/vim-use-shellcommands/
" V選択モードまたは通常でSpace + Enterでvim内のコマンド文字列を実行する。
" 行選択中に実行 
vnoremap <Space><CR> :!sh<CR>
" 行選択していない状態から実行
nnoremap <Space><CR> V:!sh<CR>

