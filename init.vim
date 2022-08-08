"pythonの設定
let g:python3_host_prog='C:\\Program Files\\Python37\python.exe'

"deinの設定
let s:dein_dir = 'C:/Users/user/.cache/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)

    let s:rc_dir = 'C:/Users/user/.vim'
    if !isdirectory(s:rc_dir)
        call mkdir(s:rc_dir, 'p')
    endif
    let s:toml = s:rc_dir . '/dein.toml'
    let s:lazy_toml = s:rc_dir . '/dein_lazy.toml'

    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy' : 1})

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
    call map(s:removed_plugins, "delete(v:val, 'rf')")
    call dein#recache_runtimepath()
endif

"プラグインオン
filetype plugin indent on

"シンタックスオン
syntax enable


"行番号表示
set number

"行末まで検索した後行頭に戻って検索
set wrapscan

"検索結果をハイライト表示(:nohで消す)
set showmatch

"tabの代わりにスペースを使用
set expandtab

"tabキーで挿入されるスペースの数
set shiftwidth=4

"中括弧を始めた後などの改行のあと自動的にインデントを入れる
set smartindent

"インデント周りの各種機能で操作されるスペースの数
set softtabstop=4

" 改行時に前の行のインデントを継承する
set autoindent

"VimではUTF-8で文字を表示する
set encoding=utf-8

"UTF-8でファイルを読み込み、ダメだったらShift_JISを試す
set fileencodings=utf-8,sjis

"UTF-8でファイルを書き込む
set fileencodings=utf-8

"クリップボードとVimの無名レジスタを結合する
set clipboard+=unnamed

"コマンドモードでtabを使ってファイル名を補完するときに、1回目は最大共通文字列、次からは順番にファイル名を完全補完する
set wildmode=longest,full

"Ctrl+J,Ctrl+Kでパラグラフ一つ分移動
nnoremap <C-j> }
nnoremap <C-k> {

"「s*」でカーソル下の単語からの置換を途中まで記述
nnoremap <expr> s* ':%s/\<' . expand('<cword>') . '\>/'

"エディタとターミナルの操作をCtrl+Tで切り替え
tnoremap <C-t> <C-\><C-n><C-w>k
nnoremap <C-t> <C-w>j i

"ターミナルモード中にEscでターミナルノーマルモードに移行
tnoremap <Esc> <C-\><C-n>

"空白可視化
set list
set listchars=tab:>>-,trail:-