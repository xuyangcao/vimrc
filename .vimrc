"============= pathogen ============
execute pathogen#infect()
syntax on
filetype plugin indent on

"=========== basic config ==========
set number              " 显示行号
set ruler               " 打开状态栏标尺
set shiftwidth=4        " 默认缩进4个空格 
set softtabstop=4       " 使用tab时 tab空格数 
set tabstop=4           " tab 代表4个空格  
set expandtab           " 使用空格替换tab
set hlsearch            " 高亮显示搜索结果
set t_Co=256            " 颜色
set showmatch           " 括号匹配
set foldmethod=indent   " 代码折叠
set foldlevel=99        " 代码折叠
set nofen               " 启动vim时打开所有折叠代码。
set history=50	        " keep 50 lines of command line history
set showcmd		        " display incomplete commands
set incsearch	        " do incremental searching
set noswapfile          " 不产生.swp文件
set modeline            " set modeline
set nocompatible        " Use Vim settings, rather then Vi settings
set wildmenu            " vim自身命令行模式智能补全
set ttimeout            " 设置ESC生效时间
set ttimeoutlen=100     " 设置ESC生效时间
set autowrite           " 自动写入
syntax enable           " 开启语义分析

" 浅色高亮当前行
autocmd InsertEnter * se cul            
" 注释针对不同语言的注释方法
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType php set commentstring=//\ %s
autocmd FileType python set commentstring=#\ %s

" 重新打开文档时光标回到文档关闭前的位置
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif

" 剪贴板复制粘贴,需安装vim-gtk
map <Leader>y "+y
map <Leader>p "+p

" 编译快捷键
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>
autocmd filetype cc nnoremap <F5> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>
autocmd filetype dot nnoremap <F5> :w <bar> exec '!dot -Tsvg sqlparse.dot > sqlparse.svg'<CR>
autocmd Filetype java nnoremap <F5> :w <bar> exec '!javac '.shellescape('%'). ' -d ./bin'<CR>
autocmd filetype java nnoremap <F2> :w <bar> exec '!java -cp ./bin '.shellescape('%:r')<CR>

"=============== YCM ================
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"============== nerdtree ============
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <C-n> :NERDTreeToggle<CR> 
let NERDTreeWinPos="left"
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']

"====== ultisnips & vim-snippets =====
"ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/ultisnips']
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical" 
nmap <c-e> :UltiSnipsEdit<CR>
"vim-snippets
let g:snips_author = "xuyangcao"
let g:snips_email = "caoxuyang@bjtu.edu.cn"
let g:snips_github = "https://xuyangcao.github.io"

"========== ctags & taglist ==========
nmap<leader>tg :!ctags -R --fields=+aS --extra=+q<CR>
nnoremap  <leader>t  :TlistToggle <CR> 
let Tlist_Inc_Winwidth=0
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let g:tlist_markdown_settings = 'markdown;h:Headlins'

"============ colorscheme ============
colorscheme molokai

"========== airlinae theme =========== 
let g:airline_theme='molokai'

"================= A =================
nmap <Leader>a :A<CR>

"============= Markdown ============== 
"Markdown Preview
nmap <F5> :MarkdownPreview<CR>
"vim markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
"vim markdown toc
nmap toc :GenTocMarked<CR>
