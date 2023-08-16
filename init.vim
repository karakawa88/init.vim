"---------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" env
".configディレクトリー
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME
let s:dein_dir = expand('$CONFIG/nvim/dein')
" python3の実行ファイルのパス
let g:python3_host_prog = expand('/usr/local/python/bin/python3')
let g:python_host_prog = expand('/usr/bin/python2.7')
"let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" test

" <leader>キーの変更
" \ からスペースキーに切り替える
" mapleaderはspaceのような特殊キーを受け付けないため \<space>とする
" また''はただの文字列でそうしたくない場合(展開など)は""を使用する。
let mapleader = "\<space>"

" packpath
set packpath+="~/.config/nvim/plugins"

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
"source ~/encode.vim

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

" キー入力
" timeoutlen
" vlというキーマップがあるとしてvが押されたら次のlを押されるのに待つ時間。
" ttimeoutlen
" [esc]などのキーが次のキー入力を待つ時間
" ここに-1を設定してあるとtimeoutlenの値が使われる timeoutlenが1000なら1秒待つ。デフォルトの設定。
set timeout timeoutlen=1000 ttimeoutlen=50

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
" 0007を認識する時8進数でなく10進数で認識するようにする
set nrformats=

"----------------------------------------------------
" 折り畳み
"----------------------------------------------------
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
nnoremap <silent> <leader>c :%s///gn<cr>
" インクリメンタルサーチを有効にする
nnoremap <silent> <leader>i :set incsearch<cr>
" インクリメンタルサーチを無効にする
nnoremap <silent> <leader>n :set noincsearch<cr>
" 検索結果文字列のハイライトを有効にする
" :nohでハイライトを消せ
" set nohlsearch
set hlsearch
" 検索結果文字列のハイライトを無効にするキーマップ
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <leader>h  :noh<cr>
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
set grepprg=grep\ -E\ -n\ -I\ --exclude=~/.config/nvim/nvim_grep_exclude.txt\ $*\ 2>/dev/null
" QuickFixに表示する一行の要素のフォーマット
set grepformat=%f:%l:%m
" vimgrep検索での除外パターン
set wildignore+=.git/**,a.out,*.o,GPATH,GRTAGS,GTAGS,ctags,tags,*.gch,__pycache__/**

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
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white
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
set hidden

"----------------------------------------------------
" ウィンドウ
"----------------------------------------------------
"ウィンドウを閉じずにバッファを閉じる
command! Bd :bp | :sp | :bn | :bd

"----------------------------------------------------
" ファイル
"----------------------------------------------------
" vim path設定
" ,,などの空文字列の指定は現在の作業ディレクトリーを表す
set path=.,./,,/usr/include
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
set termencoding=utf-8
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

"----------------------------------------------------
" vim-plug
"----------------------------------------------------
"vimplugがまだインストールされていなければインストールする
if empty(glob('~/.config/nvim/plugins/plug.vim'))
    silent !curl -fLo ~/.vim/plugin/plug.vim --create-dirs \https://raw.github.com/junegunn/vimplug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" set runtimepath+=/Users/kdbadev/.config/nvim/plugin/vim-plug.vim
source ~/.config/nvim/plugins.vim
"コンパイルに時間がかかる場合もあるためタイムアウトを伸ばす
let g:plug_timeout=300

"------------------------------------------------------
" カラースキーム
"------------------------------------------------------
" カラースキームをAtomのonedarkに変更する
"NeoBundle 'joshdick/onedark.vim'
" One Darkを有効にするために必要
"let g:onedark_termcolors=16
" カラースキーマを宣言する
" colorscheme murphy
colorscheme PaperColor

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
" tnoremap <silent> <C-g> <C-\><C-n>
"----------------------------------------------------
" NERDTree
"----------------------------------------------------
" C-eでNERDTreeの起動をトグルする
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"起動時にブックマークを表示
let NERDTreeShowBookmarks = 1
"Vim起動時にNERDTreeを開く
" autocmd VimEnter * NERDTree
"NERDTreeのウィンドウしか開かれていないときは自動的に閉じる
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && \b:NERDTree.isTabTree()) |q| endif
" vim-devicons ファイルタイプごとにアイコンを表示するプラグイン
set encoding=UTF-8
"vim-nerdtree-syntax-highlight
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

" vim-devicons
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

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
" EasyMotion
"----------------------------------------------------
" カーソル移動を高速にするプラグイン
map  <Leader><Leader>/ <Plug>(easymotion-sn)
nmap  <Leader><Leader>/ <Plug>(easymotion-sn)

"----------------------------------------------------
" タブとステータスバー
"----------------------------------------------------
" <space>t   タブを新しく作成
nmap <leader>t  :tabnew<cr>

" Airline
" airlineのタブを有効にする
let g:airline#extensions#tabline#enabled = 1
" C-p C-nでタブを切り替える
"nmap <C-p> <Plug>AirlineSelectPrevTab
"nmap <C-n> <Plug>AirlineSelectNextTab
" タブに番号をつける
let g:airline#extensions#tabline#buffer_idx_mode = 1

"----------------------------------------------------
" プログラム関連
"----------------------------------------------------
"----------------------------------------------------
" キー入力
"----------------------------------------------------
" 対応する閉じ括弧や引用符を入力する
" <esc>でInsertモードから抜けているのは真ん中にカーソルを入れるため。
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap { {}<esc>i

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
" gtags
"----------------------------------------------------
" Options
let g:Gtags_Auto_Map = 0
let g:Gtags_OpenQuickfixWindow = 1
" Keymap
" Show definetion of function cousor word on quickfix
nmap <silent> K :<C-u>exe("Gtags ".expand('<cword>'))<CR>
" Show reference of cousor word on quickfix
nmap <silent> R :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>
nnoremap <silent> <Space>f :Gtags -f %<CR>
nnoremap <silent> <Space>j :GtagsCursor<CR>
nnoremap <silent> <Space>d :<C-u>exe('Gtags '.expand('<cword>'))<CR>
nnoremap <silent> <Space>r :<C-u>exe('Gtags -r '.expand('<cword>'))<CR>

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

"" ctags
"nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
"nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

"Emacsのmulti-termでviを使うときの設定
"ESCがEmacsのキーとだぶるのでC-fを割り当て逃げる。
"imap <C-B> <Left><Del>
"nmap <C-B> <Left><Del>
"cmap <C-B> <Left><Del>
"imap <C-f> <Esc>
"nmap <C-f> <Esc>

" helpの言語の優先順位
set helplang=ja,en

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

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " ddc
" " ddcのnvimのLSP保管に必要なmasonの初期化 luaで初期化する
" lua require('plugins')
" " pum.vim
" call ddc#custom#patch_global('completionMenu', 'pum.vim')
" call ddc#custom#patch_global('ui', 'native')
" inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
" inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
" inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
" inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
" inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>
" 
" call ddc#custom#patch_global('sources', [
" \ 'nvim-lsp',
" \ 'around',
" \ 'file'
" \ ])
" call ddc#custom#patch_global('sourceOptions', {
"      \ '_': {
"      \ 'matchers': ['matcher_head'],
"      \ 'sorters': ['sorter_rank'],
"      \ 'converters': ['converter_remove_overlap'],
"      \ },
"      \ 'around': {'mark': 'A'},
"      \ 'nvim-lsp': {
"      \ 'mark': 'L',
"      \ 'forceCompletionPattern': '\.\w*|:\w*|->\w*',
"      \ },
"      \ })
" call ddc#custom#patch_global('sourceParams', {
"      \ 'nvim-lsp': { 'kindLabels': { 'Class': 'c' } },
"      \ })
" "inoremap <Tab> <Cmd>call pum#map#insert_relative(+1)<CR>
" "inoremap <S-Tab> <Cmd>call pum#map#insert_relative(-1)<CR>
" " Mappings
" " <TAB>: completion.
" inoremap <silent><expr> <C-space>
"\ pumvisible() ? '<C-n>' :
"\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
"\ '<TAB>' : ddc#map#manual_complete()
" " <S-TAB>: completion back.
" " inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'
" "call popup_preview#enable()
" "call signature_help#enable()
" " Use ddc.
" call ddc#enable()
" call popup_preview#enable()
" call signature_help#enable()

" Telescope
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>tc <cmd>lua require('telescope.builtin').commands()<cr>
nnoremap <leader>tch <cmd>lua require('telescope.builtin').command_history()<cr>
nnoremap <leader>fr frecency<cr>

"----------------------------------------------------
"  Fern ファイラー
"----------------------------------------------------
" アイコン表示の有効化
let g:fern#renderer = 'nerdfont'
" アイコンを違う色で表示する設定
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

" fzf
nnoremap <C-p> :FZFFileList<CR>
command! FZFFileList call fzf#run({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'sink': 'e'})
command! Fmru FZFMru
command! FZFMru call fzf#run({
            \  'source':  v:oldfiles,
            \  'sink':    'tabe',
            \  'options': '-m -x +s',
            \  'down':    '40%'})

"----------------------------------------------------
" テキスト処理
"----------------------------------------------------
let g:translate_source = "en"
let g:translate_target = "ja"
let g:translate_popup_window = 0 " if you want use popup window, set value 1
let g:translate_winsize = 10 " set buffer window height size if you doesn't use popup window
nmap gr <Plug>(Translate)
vmap t <Plug>(VTranslate)

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
" QuickRun 
"----------------------------------------------------
" コンパイルしてエラーを出力する
"NeoBundle "thinca/vim-quickrun"
"NeoBundle "osyo-manga/unite-quickfix"

" 出力先
" " 成功した場合：quickrun 専用の出力バッファ
" " 失敗した場合：quickfix を :copen で開く
" " バッファの開き方：botright 8sp
" "
" " cpp.type にて使用するコンパイラなどを設定する
" " cpp.cmdopt にコマンドラインオプションを設定
"
" " runner/vimproc/updatetime で出力バッファの更新間隔をミリ秒で設定できます
" " updatetime が一時的に書き換えられてしまうので注意して下さい
"        "hook/unite_quickfix/enable_failure" : 1,
"        "outputter" : "multi:buffer:quickfix",
"       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
" \       "outputter/error/success" : "buffer",
" \       "outputter/error/error"   : "quickfix",
" let g:quickrun_config = {
" \   "_" : {
" \       "runner" : "vimproc",
" \       "runner/vimproc/updatetime" : 60,
" \       "outputter" : "quickfix",
" \       "outputter/buffer/split" : ":botright 8sp",
" \       "outputter/quickfix/open_cmd" : "copen",
" \       "outputter/buffer/close_on_empty" : 1,
" \       "hook/close_quickfix/enable_exit" : 1,
" \       "hook/close_buffer/enable_failure" : 1,
" \       "hook/close_buffer/enable_empty_data" : 1,
" \       "hook/shabadoubi_touch_henshin/enable" : 1,
" \       "hook/shabadoubi_touch_henshin/wait" : 20,
" \   },
" \   "cpp" : {
" \       "type" : "cpp/g++",
" \       "command" : "g++",
" \       "exec" : "%c %o %s:%p",
" \       "cmdopt" : "-std=c++17 -Wall",
" \   },
" \   "c" : {
" \       "type" : "c/gcc",
" \       "cmdopt" : "-Wall",
" \   },
" \   "watchdogs_checker/_" : {
" \       "hook/u_nya_/enable" : 1,
" \       "hook/inu/enable" : 0,
" \       "hook/unite_quickfix/enable" : 0,
" \       "hook/echo/enable" : 0,
" \       "hook/back_buffer/enable" : 0,
" \       "hook/close_unite_quickfix/enable" : 0,
" \       "hook/close_buffer/enable_exit" : 0,
" \       "hook/close_quickfix/enable_exit" : 1,
" \       "hook/redraw_unite_quickfix/enable_exit" : 0,
" \       "hook/close_unite_quickfix/enable_exit" : 1,
" \   },
" \   "cpp/watchdogs_checker" : {
" \       "type" : "watchdogs_checker/g++"
" \   },
" \   "watchdogs_checker/g++" : {
" \       "command"   : "g++",
" \       "exec"      : "%c %o -fsyntax-only %s:p ",
" \       "cmdopt" : "-std=c++17 -fsyntax-only ",
" \   },
" \   "c/watchdogs_checker" : {
" \       "type" : "watchdogs_checker/gcc"
" \   },
" \   "watchdogs_checker/gcc" : {
" \       "command"   : "gcc",
" \       "exec"      : "%c %o -fsyntax-only %s:p ",
" \       "cmdopt" : " -fsyntax-only ",
" \   },
" \}

" <C-c> で実行を強制終了させる
" quickrun.vim が実行していない場合には <C-c> を呼び出す
"nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" " :QuickRun 時に quickfix の中身をクリアする
" " こうしておかないと quickfix の中身が残ったままになってしまうため
" let s:hook = {
" \   "name" : "clear_quickfix",
" \   "kind" : "hook",
" \}

" function! s:hook.on_normalized(session, context)
"      call setqflist([])
" endfunction

"call quickrun#module#register(s:hook, 1)
"unlet s:hook
"quickrun の buffer を開く場所を指定することが可能です。
" set splitbelow	新しいウィンドウを下に開く 
" set splitright	新しいウィンドウを右に開く 
" set splitright

"----------------------------------------------------
" NeoBundle ファイル関連
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
" NeoBundle 編集
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
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"コメント関連
"caw-vim
nmap <Leader>c <Plug>(caw:I:toggle)
vmap <Leader>c <Plug>(caw:I:toggle)

"----------------------------------------------------
" NeoBundle 検索・置換
"----------------------------------------------------

"----------------------------------------------------
" NeoBundle 表示
"----------------------------------------------------
" onedark.vim

" タブ・ステータスバーの表示
" NeoBundle 'itchyny/lightline.vim'
" let g:lightline = {
" \ 'colorscheme': 'wombat',
" \ 'component': {
" \   'readonly': '%{&readonly?"x":""}',
" \ },
" \ 'separator': { 'left': '', 'right': '' },
" \ 'subseparator': { 'left': '|', 'right': '|' }
" \ }
"
" "NeoBundle 'vim-airline/vim-airline'
" " " Powerline系フォントを利用する
" " let g:airline_powerline_fonts=1
" " " タブバーのカスタマイズを有効にする
" " let g:airline#extensions#tabline#enabled=1
" " " タブバーの右領域を非表示にする
" " let g:airline#extensions#tabline#show_splits=0
" " let g:airline#extensions#tabline#show_tab_type=0
" " let g:airline#extensions#tabline#show_close_button=0
" " " airlineをカラースキームonedark風に変更する
" " let g:airline_theme='onedark'
" " "NeoBundle 'joshdick/airline-onedark.vim'
"
"----------------------------------------------------
" プログラム関連
"----------------------------------------------------
" シンタックスチェック
" ALE
" eslint_dを利用するための設定
if executable('eslint_d')
    let g:ale_javascript_eslint_use_global = 1
    let g:ale_javascript_eslint_executable = 'eslint'
endif
let g:ale_linters_explicit = 1
" ESLint \   'javascript': ['eslint']
let g:ale_linters = {
\       'javascript': ['eslint'],
\       'tex': ['chktex']
\ }
let g:ale_tex_chktex_options = '-n 8'
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
" ファイルオープン時にチェックしたくない場合
let g:ale_lint_on_enter = 0


" ドキュメント
" Doxygenコメント自動生成
let g:DoxygenToolkit_briefTag_pre="@brief  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@return   "
"let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
"let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="荒川　健太郎"
"let g:DoxygenToolkit_licenseTag="My own license"   <-- !!! Does not end with "\<enter>"

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

"----------------------------------------------------
" C/C++プログラム関連
"----------------------------------------------------
"C/C++パス設定
"let path+=/usr/include,/usr/local/include
"C/C++補完
" vim-clang
" 'justmao945/vim-clang' {{{
" disable auto completion for vim-clanG
" let g:neocomplete#enable_at_startup = 1
" let g:clang_auto = 0
" let g:clang_complete_auto = 0
" let g:clang_auto_select = 0
" let g:clang_use_library = 1
"
" " default 'longest' can not work with neocomplete
" let g:clang_c_completeopt   = 'menuone'
" let g:clang_cpp_completeopt = 'menuone'
"
" if executable('clang-3.9')
"     let g:clang_exec = 'clang-3.9'
" elseif executable('clang-3.6')
"     let g:clang_exec = 'clang-3.6'
" elseif executable('clang-3.5')
"     let g:clang_exec = 'clang-3.5'
" elseif executable('clang-3.4')
"     let g:clang_exec = 'clang-3.4'
" elseif executable('clang-8')
"     let g:clang_exec = 'clang-8'
" else
"     let g:clang_exec = 'clang'
" endif
"
" if executable('clang-format-3.9')
"     let g:clang_format_exec = 'clang-format-3.9'
" elseif executable('clang-format-3.6')
"     let g:clang_format_exec = 'clang-format-3.6'
" elseif executable('clang-format-3.5')
"     let g:clang_format_exec = 'clang-format-3.5'
" elseif executable('clang-format-3.4')
"     let g:clang_format_exec = 'clang-format-3.4'
" elseif executable('clang-format-8')
"     let g:clang_format_exec = 'clang-format-8'
" else
"     let g:clang_exec = 'clang-format'
" endif
"
" let g:clang_c_options = '-std=gnu11'
" let g:clang_cpp_options = '-std=c++z -stdlib=libc++'
" " }}}

" vim-lsp
"""""" vim-lsp
" let g:lsp_diagnostics_enabled = 1  " disable diagnostics support
" let g:lsp_signs_enabled = 0           " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
" let g:lsp_virtual_text_enabled = 0
" let g:lsp_highlights_enabled = 0
" let g:lsp_textprop_enabled = 0
" debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/.config/nvim/log/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/.config/nvim/log/asyncomplete.log')
" 
" nnoremap <Space>ld :LspDefinition<CR>
" " back to the original place by typing Ctrl-o
" nnoremap <Space>lf :LspDocumentFormat<CR>
" nnoremap <Space>lh :LspHover<CR>
" nnoremap <Space>lr :LspReferences<CR>
" completion by C-p, selection by C-n, C-p, choosing by C-y, Enter

" deocomplete-clang
let g:deoplete#sources#clang#libclang_path = system("llvm-config --prefix")[:-2] . '/lib/libclang-12.so.1'
let g:deoplete#sources#clang#clang_header = system("llvm-config --prefix")[:-2] . '/include/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
let g:deoplete#sources#clang#clang_complete_database="./build/"

" watchdogs
" この関数で g:quickrun_config にシンタックスチェックを行うための設定を追加する
" 関数を呼び出すタイミングはユーザの g:quickrun_config 設定後
" call watchdogs#setup(g:quickrun_config)
" " 書き込み後にシンタックスチェックを行う
" let g:watchdogs_check_BufWritePost_enable = 1
"
" " filetype ごとに有効無効を設定することも出来る
" let g:watchdogs_check_BufWritePost_enables = {
" \   "cpp" : 1,
" \}
" " こっちは一定時間キー入力がなかった場合にシンタックスチェックを行う
" " バッファに書き込み後、1度だけ行われる
" let g:watchdogs_check_CursorHold_enable = 1
" " filetype=ruby は無効になる
" let g:watchdogs_check_CursorHold_enables = {
" \   "python" : 1,
" \   "ruby"   : 0,
" \}

" vim-hier
" エラー箇所をハイライトするためには quickfix を参照してハイライトを行う、vim-hier を導入します。
"NeoBundle "jceb/vim-hier"

"----------------------------------------------------
" WEB関連
"----------------------------------------------------
" HTML5
" emmet.vim
let g:user_emmet_install_global = 0
" emmet.vimのキーバインドはデフォルトで<C-y>だがそれを変更できる。
let g:user_emmet_leader_key='<c-t>'
let g:use_emmet_complete_tag = 1
autocmd FileType html,css,javascript,jsx EmmetInstall
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\  'javascript.js' : {
\      'extends' : 'js',
\  },
\}
" alvan/vim-closetag
" 閉じタグを自動で閉じる
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" open-browser.vim
" URL文字列にコマンドを指定するとブラウザーにそのURLのホームページを表示し、
" ただの文字列ならブラウザーでその文字列を検索する
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
" :OpenBrowserCurrent すれば現在のバッファで編集している HTML ファイルがブラウザで開かれます。
command! OpenBrowserCurrent execute "OpenBrowser" expand("%:p")

"----------------------------------------------------
" CSS
"----------------------------------------------------
" vim-css3-syntax
" HTML5同様デフォルトでは色がつきません。このプラグインを入れてCSSの内容に色を付けます。
"----------------------------------------------------
" JavaScript
"----------------------------------------------------
" vim-javascript-syntax
" JavaScriptのSyntaxに色を付ける
" JavaScript ES6のシンタックスハイライト
" 構文チェック
" let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"
" autocmd! BufWritePost * Neomake " 保存時に実行する
" let g:neomake_javascript_enabled_makers = ['eslint']
" " NeoBundle 'benjie/neomake-local-eslint.vim'
"
" let g:neomake_error_sign = {'text': '>>', 'texthl': 'Error'}
" let g:neomake_warning_sign = {'text': '>>',  'texthl': 'Todo'}
" " .eslintrcに設定を書き込まない場合記述
" let g:neomake_javascript_eslint_maker = {
"     \ 'exe': 'eslint',
"     \ 'args': ['-f', 'compact'],
"     \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
"         \ '%W%f: line %l\, col %c\, Warning - %m'
"     \ }

" JavaScript補完
" 辞書ファイル
autocmd FileType javascript :set dictionary=$HOME/.vim/dict/javascript.dict
" DOMとMozilla関連とES6のメソッドを補完
let g:jscomplete_use = ['dom', 'moz', 'es6th']
" Tern for vim
"NeoBundle 'marijnh/tern_for_vim'
"---------------------------------------------------
" JSON
"---------------------------------------------------
" JSONファイルでダブルクオーテーションを有効にする
let g:vim_json_syntax_conceal = 0


""LaTex関連
" NeoBundle "vim-latex/vim-latex"
" set shellslash
" let g:Tex_AutoFolding = 0
" let g:Tex_Folding = 0
" let g:Imap_UsePlaceHolders = 1 
" let g:Imap_DeleteEmptyPlaceHolders = 1 
" let g:Imap_StickyPlaceHolders = 0 
" let g:tex_flavor = 'latex'
" let g:Imap_FreezeImap = 0
" let g:Tex_SmartKeyQuote = 0
" let g:Tex_EnvironmentMaps = 0
" let g:Tex_MathMenus = 0
" VimのTex関連のconceal機能
" 数式を入力する$$の中に特殊文字(累乗や記号など)をカーソル行でない場合はその特殊文字を表示する機能。
" カーソル行の時は普通のLaTeXの命令文が表示されるが編集時におかしなことになる。
" そのためこの機能を無効化する。
let g:tex_conceal=''
" LaTeX専用辞書ファイルの指定
autocmd FileType tex :let &l:dictionary = '~/.config/nvim/dict/tex.dict'
" BibTeX
" BibTeX用辞書ファイルの指定
autocmd FileType bib :let &l:dictionary = '~/.config/nvim/dict/bibtex.dict'
" SkimとSyncTeXする設定
let g:vimtex_fold_enabled =0
if has('mac')
  let g:vimtex_view_method='skim'
else
  let g:vimtex_view_method='zathura'
endif
if has('nvim')
  let g:vimtex_compiler_progname='nvr'
endif
let g:vimtex_view_method='skim'
let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '@line @pdf @tex'
let g:vimtex_imaps_enabled = 0

""Python関連
" Python jedi
" NeoBundle 'davidhalter/jedi-vim'
" ""jedi-vim Setting
" "
" "Pythonのファイルを保存するたびにタグファイルを再生成する
autocmd BufWritePost *.py silent! !ctags -R &

autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#force_py_version = 3
" 補完機能を有効化
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
" if !exists('g:neocomplete#force_omni_input_patterns')
"     let g:neocomplete#force_omni_input_patterns = {}
" endif
"補完時にdocstring（モジュール、クラス、関数などの説明文）のポップアップウィンドウ
"（前のキャプチャ画像で上部に表示されている）が表示されるが、無効にする
autocmd FileType python setlocal completeopt-=preview
" 補完の設定
" 補完候補の最初の一番目を入力
let g:jedi#popup_select_first=1
" 関数の引数表示を有効化（2を指定すればコマンドラインに表示）
let g:jedi#show_call_signatures = 2
"g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
"
" NeoBundle 'Flake8-vim'
" NeoBundle 'hynek/vim-python-pep8-indent'
" NeoBundle 'Townk/vim-autoclose'
" " "" pyflaks
" let g:pyflakes_use_quickfix = 0
" "保存時に自動でチェック
" let g:PyFlakeOnWrite = 1
" let g:PyFlakeCheckers = 'pep8,mccabe,pyflakes'
" let g:PyFlakeDefaultComplexity=10
" "" Neomakeでの構文チェック
" let g:neomake_python_enabled_makers = ['python', 'flake8', 'mypy']

set nocompatible
filetype plugin on
filetype plugin indent on

" myconfig
" source ~/.vim/vimsrc/buflocal.vim

" NeoBundle 'altercation/vim-colors-solarized'
" syntax enable
" set background=dark    "または light
" colorscheme solarized

" コマンドランチャー
" URL: https://dev.classmethod.jp/articles/vim-use-shellcommands/
" V選択モードまたは通常でSpace + Enterでvim内のコマンド文字列を実行する。
" 行選択中に実行 
vnoremap <Space><CR> :!sh<CR>
" 行選択していない状態から実行
nnoremap <Space><CR> V:!sh<CR>



