"===============pathogen=================
execute pathogen#infect()
syntax on
filetype plugin indent on

""===============基本设置=================
set number              "显示行号
set ruler               "打开状态栏标尺
syntax on               "自动语法高亮 
set shiftwidth=4        "默认缩进4个空格 
set softtabstop=4       "使用tab时 tab空格数 
set tabstop=4           "tab 代表4个空格  
set expandtab           "使用空格替换tab
set showmatch           "高亮显示匹配的括号
set hlsearch            "高亮显示搜索结果
set t_Co=256            "颜色
set foldmethod=indent   "代码折叠
set foldlevel=99        "代码折叠
nnoremap <space> za     "代码折叠

"===============nerdtree=================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif "当没指定文件时nerdtree自动打开
map <C-n> :NERDTreeToggle<CR> 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "当只剩下nerdtree时候vim自动退出

"==================YCM====================
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"================ultisnips================
""Trigger configuration. Do not use <tab> if you use
"https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"================airlinae================= 
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

"================colorscheme==============
colorscheme molokai
