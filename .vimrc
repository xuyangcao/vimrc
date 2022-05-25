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

"新建.c,.h,.sh,.Java, .python文件，自动插入文件头
autocmd BufNewFile *.py,*.cpp,*.cc,*.[ch],*.sh,*.Java,*.go exec ":call SetTitle()"
func SetTitle()
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."),   "\# File Name:    ".expand("%"))
        call append(line(".")+1, "\# Author:       xuyangcao")
        call append(line(".")+2, "\# Mail:         caoxuyang@bjtu.edu.cn")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."),   "> File Name:     ".expand("%"))
        call append(line(".")+1, "> Author:        xuyangcao")
        call append(line(".")+2, "> Mail:          caoxuyang@bjtu.edu.cn")
        call append(line(".")+3, "> Created Time:  ".strftime("%c"))
        call append(line(".")+4, "> Description:   ")
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif
endfunc
autocmd BufNewFile * normal G     "新建文件后，自动定位到文件末尾


"=============== YCM ================
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"============== nerdtree ============
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif "当没指定文件时nerdtree自动打开
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "当只剩下nerdtree时候vim自动退出
map <C-n> :NERDTreeToggle<CR> 
" 使用NERDTree插件查看工程文件。设置快捷键
nnoremap <silent> <Leader>n  :NERDTreeToggle <CR> 
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 设置忽略的文件
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']

"============= ultisnips ============
"Trigger configuration. Do not use <tab> if you use
"https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-o>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"========== ctags & taglist ==========
nmap<leader>tg :!ctags -R --fields=+aS --extra=+q<CR>
nnoremap  <leader>t  :TlistToggle <CR> 
let Tlist_Inc_Winwidth=0            "禁止自动改变当前Vim窗口的大小
let Tlist_Use_Right_Window=1        "把方法列表放在屏幕的右侧
let Tlist_File_Fold_Auto_Close=1    "让当前不被编辑的文件的方法列表自动折叠起来
let g:tlist_markdown_settings = 'markdown;h:Headlins'

"============ colorscheme ============
colorscheme molokai

"========== airlinae theme =========== 
let g:airline_theme='molokai'

"================= A =================
nmap <Leader>a :A<CR>         " 快速切换C H源文件(a.vim)


"============= Markdown ============== 
"Markdown Preview
nmap <F8> <Plug>MarkdownPreview
nmap <F9> <Plug>MarkdownPreviewStop
"vim markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
"vim markdown toc
nmap toc :GenTocMarked<CR>
" picture
nmap pic :call SetPic()<CR>
func SetPic()
    call append(line("."), "\<div class=\"fig figcenter\"\>")
    call append(line(".")+1, "\t\<img src=\"{{ site.baseurl }}/assets/*.png\" width=600px\>")
    call append(line(".")+2, "\t\<div class=\"figcaption\"\>xxx\</div\>")
    call append(line(".")+3, "\</div\>")
endfunc
