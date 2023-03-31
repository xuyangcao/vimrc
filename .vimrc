"============= pathogen ============
execute pathogen#infect()
syntax on
filetype plugin indent on

"=========== basic config ==========
set encoding=utf-8      " encoding
set number              " show line number
set ruler               " Show the line and column number of the cursor position
set shiftwidth=4        " Number of spaces to use for each step of (auto)indent
set softtabstop=4       " Number of spaces that a <Tab> counts for whild editing
set tabstop=4           " Number of spaces that a <Tab> in the file counts for
set expandtab           " In Insert mode: Use the appropriate number of spaces to insert a <Tab>
set hlsearch            " Last search pattern highlighting
set showmatch           " When a bracket is inserted, briefly jump to the matching one
set foldmethod=indent   " The kind of folding used for the current window
set foldlevel=99        " Sets the fold level
set nofen               " All folds are open
set history=50	        " Keep 50 lines of command line history
set showcmd             " Display incomplete commands
set incsearch	        " Do incremental searching
set noswapfile          " Open a new buffer without creating a swap file for it
set modeline            " set modeline
set nocompatible        " Use Vim settings, rather then Vi settings
set wildmenu            " Command-line completion operates in an enhanced mode
set ttimeout            " Timeout on key codes
set ttimeoutlen=100     " The time in milliseconds that is waited for a key code or mapped key sequence to complete
set autowrite           " Write the contents of the file, if it has been modified
syntax enable           " Enable syntax

" Highlight current line
autocmd InsertEnter * se cul            
" Comments according to different lauguages
autocmd FileType cpp set commentstring=//\ %s
autocmd FileType php set commentstring=//\ %s
autocmd FileType python set commentstring=#\ %s

" When the document is reopened, the cursor returns to the position before the document was closed
if has("autocmd")
 autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$") |
 \ exe "normal g'\"" |
\ endif
endif

" Copy & paste using the true clipboard, vim-gtk required
map <Leader>y "+y
map <Leader>p "+p

" Compile shortcuts
autocmd filetype python nnoremap <F5> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>
autocmd filetype cc nnoremap <F5> :w <bar> exec '!g++ --std=c++11 -pthread '.shellescape('%').' -o ./bin/'.shellescape('%:r').' && ./bin/'.shellescape('%:r')<CR>
autocmd filetype dot nnoremap <F5> :w <bar> exec '!dot -Tsvg sqlparse.dot > sqlparse.svg'<CR>
autocmd Filetype java nnoremap <F5> :w <bar> exec '!javac '.shellescape('%'). ' -d ./bin'<CR>
autocmd filetype java nnoremap <F2> :w <bar> exec '!java -cp ./bin '.shellescape('%:r')<CR>

"=============== YCM ================
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
nnoremap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
let g:ycm_collect_identifiers_from_tags_files = 1

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

"================ tags ===============
set tags=tags
set tags+=~/.vim/tagfiles/opencv.tags

"============== taglist ==============
nnoremap  <leader>t  :TlistToggle <CR> 
let Tlist_Inc_Winwidth=0
let Tlist_Use_Right_Window=1
let Tlist_File_Fold_Auto_Close=1
let g:tlist_markdown_settings = 'markdown;h:Headlins'

"============ colorscheme ============
colorscheme molokai

"========== airlinae theme =========== 
let g:airline_theme='molokai'

"============= Markdown ============== 
"Markdown Preview
nmap <F5> :MarkdownPreview<CR>
"vim markdown
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_new_list_item_indent = 0
"vim markdown toc
nmap toc :GenTocMarked<CR>
