" Vundle setting
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'kana/vim-textobj-user'
Plugin 'gcmt/wildfire.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'easymotion/vim-easymotion'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'davidhalter/jedi-vim'
"Plugin 'vim-scripts/Pydiction'
Plugin 'vimcn/vimcdoc'
"Plugin 'julienr/vim-cellmode'
"Plugin 'ivanov/vim-ipython'
"Plugin 'rhysd/vim-textobj-anyblock'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'ervandew/supertab'
"Plugin 'vim-scripts/Conque-Shell'
"Plugin 'ivanov/vim-ipython'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'ZichaoLong/zlong-vim-config'
Plugin 'ZichaoLong/vim-cellmode'
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nocompatible "非vi兼容模式
set incsearch "实时查找
set nohlsearch
set number "显示行号
set smartindent "智能缩进
"set tw=80 "80字符自动换行
"set fo+=m "自动换行的汉字支持
set cc=80 "让第80列高亮
set cindent
"set cinoptions=g2
autocmd BufReadPost *.tex,*.cc,*.cpp,*.c,*.h setlocal shiftwidth=2
set expandtab "制表符展开成空格。输入制表符需ctrl-V+tab
set tabstop=4 "设置制表符tab等同的空格长度
set softtabstop=4 "按tab键产生的空白宽度,当空白达到tabstop宽度,且未设置expandtab时成为真正的制表符,否则是一些空格的组合.若设置了expandtab则是空格
set shiftwidth=4 "程序自动缩进宽度
set history=88 "记录历史记录88条
set mouse=a "使用鼠标
set ruler " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。
set linebreak "英文整词不换行
set ignorecase smartcase "查找忽略大小写，如果查找内容包含大写则查找大写
set hidden"允许不保存切换buffer
"set autochdir"自动切换vim的工作目录到当前文件所在目录。
"hi CursorLine cterm=NONE ctermfg=white ctermbg=darkgrey "高亮当前行的前景背景颜色
set backspace=indent,eol,start

set fileencodings=ucs-bom,utf-8,chinese,cp936,gb18030,big5,euc-jp,euc-kr,latin1 "打开文件时用这些编码识别
set fileencoding=utf-8 "默认编码
au BufWritePre * if !&bin && &fenc != 'utf-8' | set fenc=utf-8 | endif "不管打开什么编码的文件，保存时都用utf-8
autocmd BufWritePre * setlocal ff=unix
autocmd BufWritePre *.tex,*.txt,*.md,*.m setlocal ff=dos
"autocmd BufWritePre *.tex,*.cc,*.cpp,*.c,*.h,*.m,*.py setlocal ff=unix

runtime macros/matchit.vim"支持匹配关键字跳转
"Jump to the last position when reopening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set cursorline"高亮当前行
syntax enable on "语法高亮
hi ColorColumn cterm=NONE ctermfg=white ctermbg=darkgrey "高亮指定列(set cc)的前景背景颜色
highlight Folded ctermfg=3 ctermbg=NONE"设置折叠颜色
" 禁止gvim光标闪烁
set gcr=a:block-blinkon0
"设置gvim下的配色方案及字体
if has("gui_running")
    color molokai
    set guifont=Ubuntu\ Mono\ 12
    set cc=""
else
    "let g:molokai_original=1
    "let g:rehash256=1
    "color molokai
    "set guifont=Ubuntu\ Mono\ 12
endif

"窗口操作
nnoremap <silent> <C-w>t :tabe<Space>
nnoremap <silent> <C-w>K :resize -3<CR>
nnoremap <silent> <C-w>J :resize +3<CR>
nnoremap <silent> <C-w>L :vertical resize +3<CR>
nnoremap <silent> <C-w>H :vertical resize -3<CR>
"nnoremap <c-w>a <Esc>:ConqueTermVSplit bash<CR>

"<F4>生成当前目录及子目录的tags文件。
nnoremap <F4> :!ctags -R<CR> 
nmap <Leader>t <C-t> "C-t可用于tags跳转
"粘贴后光标跳至粘贴文本最后
nnoremap <silent> p p`] 
nnoremap <silent> <Leader>w :w<CR>


"新建.c,.cpp,.h文件，自动插入文件头
autocmd BufNewFile *.cpp,*.c, exec ":call ZLONG_SetSource()" 
autocmd BufNewFile *.h exec ":call ZLONG_SetHeadGate()"
autocmd BufNewFile *.py exec ":call ZLONG_SetPyScript()"
autocmd BufNewFile *.pbs 0r ~/.vim/bundle/zlong-vim-config/template/pbs
autocmd BufNewFile *pbs set syn=sh "sh规则高亮pbs脚本


let g:UltiSnipsExpandTrigger="<tab>"
""不使用<Tab>(pydiction的补全提示)
"let g:UltiSnipsJumpForwardTrigger="<c-n>"
"let g:UltiSnipsJumpBackwardTrigger="<c-p>"

map <SPACE> <Plug>(wildfire-fuel)
vmap <Leader><SPACE> <Plug>(wildfire-water)
map <Leader><Leader><SPACE> <Plug>(wildfire-quick-select)
let g:wildfire_objects = ["iw","i'","i\"","i)","i]","i}","i<","ip","aw","a'","a\"","a)","a]","a}","a<","ap"]

let g:session_autoload = 0
let g:session_autosave = 0

"" jedi-vim 关掉completions_enabled之后，若不关掉auto_initialization，
"" 输入括号仍然会很慢的补全提示，所以手动定义map
"let g:jedi#auto_initialization = 0
"let g:jedi#goto_command = "<leader>d"
""let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>u"
""let g:jedi#rename_command = "<leader>r"
""let g:jedi#force_py_version = 3
"let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#popup_on_dot = 1 "若需要补全自定义函数及参数，可以先用<Leader>u(sage)
"let g:jedi#completions_enabled = 0
"let g:jedi#completions_command = ""
"let g:jedi#smart_auto_mappings = 0
"if len(g:jedi#goto_command)
"    execute 'nnoremap <buffer> '.g:jedi#goto_command.' :call jedi#goto()<CR>'
"endif
"if len(g:jedi#goto_assignments_command)
"    execute 'nnoremap <buffer> '.g:jedi#goto_assignments_command.' :call jedi#goto_assignments()<CR>'
"endif
"if len(g:jedi#goto_definitions_command)
"    execute 'nnoremap <buffer> '.g:jedi#goto_definitions_command.' :call jedi#goto_definitions()<CR>'
"endif
"if len(g:jedi#usages_command)
"    execute 'nnoremap <buffer> '.g:jedi#usages_command.' :call jedi#usages()<CR>'
"endif
"" rename
"if len(g:jedi#rename_command)
"    execute 'nnoremap <buffer> '.g:jedi#rename_command.' :call jedi#rename()<CR>'
"    execute 'vnoremap <buffer> '.g:jedi#rename_command.' :call jedi#rename_visual()<CR>'
"endif
"" documentation/pydoc
"if len(g:jedi#documentation_command)
"    execute 'nnoremap <silent> <buffer>'.g:jedi#documentation_command.' :call jedi#show_documentation()<CR>'
"endif

"let g:pydiction_location = '~/.vim/complete-dict/complete-dict'

"let g:ycm_python_binary_path = 'python'
"let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
"let g:ycm_key_invoke_completion = '<C-i>'


let g:ctrlsf_confirm_save = 0
let g:ctrlsf_ackprg = $HOME.'/.vim/bundle/zlong-vim-config/dependence/ack'
let g:ctrlsf_position = 'left'
"search the word under the cursor
nmap <C-F>n <Plug>CtrlSFCwordPath<CR>
"input :CtrlSF in command line
nmap <C-F>f <Plug>CtrlSFPrompt
"search current visual selection text
vmap <C-F>n <Plug>CtrlSFVwordExec

let g:cellmode_default_mappings = 1

let g:tex_flavor = 'tex'

let g:vim_markdown_folding_disabled = 1

