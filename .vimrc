set runtimepath+=~/.vim
set nocompatible              " be iMproved, required
filetype off                  " required

"现在使用新的插件管理vim-plus
"先检查是否存在这个插件管理器,设置文件夹目录
let $BUNDLE = expand("$HOME/.vim")
let $PLUG_DIR = expand("$BUNDLE/autoload")
let $OTHERPLUG_DIR = expand("$BUNDLE/bundle")

if empty(glob(expand("$PLUG_DIR/plug.vim")))
    silent !curl -fLo $PLUG_DIR/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
source $PLUG_DIR/plug.vim
call plug#begin(expand($OTHERPLUG_DIR))
"信息标记      
Plug 'vim-scripts/TaskList.vim'
"语法检查插件,仅支持VIM8.0以上版本  
Plug 'w0rp/ALE'
"自动填充插件
Plug 'Valloric/YouCompleteMe'
"文件检索插件 代替CtrlP
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
"资源管理器
Plug 'scrooloose/nerdtree'
"条带
Plug 'vim-airline/vim-airline'
"高亮          
Plug 'vim-scripts/Mark'
"撤销 在调用时候加载
Plug 'vim-scripts/Gundo'
"自动索引更新
Plug 'ludovicchabant/vim-gutentags'
"版本控制修改内容比较
Plug 'mhinz/vim-signify'
" Should run at last
call plug#end() 

"*****************************************************
"                Gundo配置                           *
"*****************************************************
nnoremap ,. :GundoToggle<CR>
"*****************************************************
"                由LeaderF配置                       *
"*****************************************************
let g:Lf_ShortcutF = '<c-p>'
"ALT+N 打开 Buffer 搜索
let g:Lf_ShortcutB = '<c-b>'
"CTRL+m 打开 最近文件搜索 文件模糊匹配
noremap <c-m> :LeaderfMru<cr>
"CTRL+f 在当前项目目录打开函数搜索
noremap <c-f> :LeaderfFunction!<cr>
"CTRL+b 打开 Buffer 搜索
noremap <c-b> :LeaderfBuffer<cr>
"CTRL+t 打开标签搜索
noremap <c-t> :LeaderfTag<cr>
"CTRL+L 打开行搜索
noremap <c-l> :LeaderfLine<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"*****************************************************
"                标签页配置                            *
"*****************************************************
"shift tab pages
":help tab-page-intro命令，可以获得关于标签页使用的更多信息。
map <F3> :tabp<CR>
"map <F4> :tabn<CR>

"*****************************************************
"                Mark配置                            *
"*****************************************************
nmap <F2> \m
"nmap <F3> \n

"*****************************************************
"            TaskList配置                            *
"*****************************************************
inoremap mk #TODO
map <silent><F11> <Plug>TaskList

"*****************************************************
"           airline配置(代替powerline)               *
"*****************************************************
"set nocompatible
set t_Co=256
set laststatus=2
"let g:Powerline_symbols = 'fancy'

"*****************************************************
"                   ALE配置                          *
"*****************************************************
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
"打开文件时进行检查
let g:ale_lint_on_enter = 1
"normal模式下，进行检查
let g:ale_lint_on_text_changed = 'normal'
"离开insert模式，进行检查
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
"样式
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_info = '--'
let g:ale_sign_style_error = '✗'
let g:ale_sign_style_warning = '⚠'
let g:ale_sign_warning = '⚠'
let g:ale_set_highlights = 0
"let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'cpp': ['clang'],
\   'c': ['clang'],
\   'py': ['pylint'],
\}

"********************************************************
"                      NERD_Tree 配置                   *
"********************************************************
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '▸'
"显示增强
let NERDChristmasTree=1
"自动调整焦点
let NERDTreeAutoCenter=1
"鼠标模式:目录单击,文件双击
let NERDTreeMouseMode=2
"打开文件后自动关闭
let NERDTreeQuitOnOpen=0
"显示文件
let NERDTreeShowFiles=1
"显示隐藏文件
let NERDTreeShowHidden=0
"高亮显示当前文件或目录
let NERDTreeHightCursorline=1
"显示行号
let NERDTreeShowLineNumbers=1
"窗口位置
let NERDTreeWinPos='left'
"窗口宽度
let NERDTreeWinSize=31
"不显示'Bookmarks' label 'Press ? for help'
let NERDTreeMinimalUI=1
"快捷键
"map <C-d> :NERDTreeToggle<CR>
nnoremap <silent> <F12> :NERDTreeToggle<CR>
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
"只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 设置当文件被改动时自动载入
" set autoread

"*****************************************************
"           YouCompleteMe配置                        *
"*****************************************************
"leader映射为逗号“，”
"配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"跳转到定义
"nnoremap <silent> gb :YcmCompleter GoToDefinitionElseDeclaration<CR>   
"nnoremap <silent> jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0   
"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1 
"静态检查
"map <F6> : YcmDiags<CR>
"nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:syntastic_always_populate_loc_list = 1
"语义补全
"let g:ycm_key_invoke_completion = '<F7>'
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2 
let g:ycm_min_num_identifier_candidate_chars = 2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0  
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1   
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"2018-08-27 新增配置
"关闭预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
"关闭代码诊断
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
"YCM 里触发语义补全有一个快捷键：
"let g:ycm_key_invoke_completion = '<c-space>'
"默认是用 CTRL+SPACE 来触发补全的，中文操作系统下，CTRL+SPACE被系统劫持用作输入法切换，无法正确传到终端，所以一般要改成 CTRL+Z：
let g:ycm_key_invoke_completion = '<c-z>'
"禁用默认的标准<c-z>映射，映射到NOP上
noremap <c-z> <NOP>
"ycm里默认的语义补全触发规则
"let g:ycm_semantic_triggers =  {
"  \   'c' : ['->', '.'],
"  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
"  \             're!\[.*\]\s'],
"  \   'ocaml' : ['.', '#'],
"  \   'cpp,objcpp' : ['->', '.', '::'],
"  \   'perl' : ['->'],
"  \   'php' : ['->', '::'],
"  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
"  \   'ruby' : ['.', '::'],
"  \   'lua' : ['.', ':'],
"  \   'erlang' : [':'],
"  \ }
"  补充触发规则
let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ } 
"YCM检测白名单配置
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "h":1,
            \ "py":1,
			\ }
"补全条颜色配置
"highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
"highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
"*****************************************************
"                   ctags配置                        *
"*****************************************************
"前半部分 “./.tags; ”代表在文件的所在目录下
"（不是 “:pwd”返回的 Vim 当前目录）查找名字为 “.tags”的符号文件，
"后面一个分号代表查找不到的话向上递归到父目录，
"直到找到 .tags 文件或者递归到了根目录还没找到，
"这样对于复杂工程很友好，源代码都是分布在不同子目录中，
"而只需要在项目顶层目录放一个 .tags文件即可；
"逗号分隔的后半部分 .tags 是指同时在 Vim 的当前目录
"（“:pwd”命令返回的目录，可以用 :cd ..命令改变）下面查找 .tags 文件
set tags=./.tags;,.tags
set nocscopeverbose "duplicate cscope database not added 解决方法"
"set autochdir

"*****************************************************
"                gutentags配置                       *
"*****************************************************
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^其他设置^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
"二进制切换映射
noremap ba :%!xxd<CR>
noremap ab :%!xxd -r<CR>

"^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^通用设置^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
set number   "显示行号
set nowrap   "不换行
set shiftwidth=4 
set softtabstop=4  "使用tab时 tab空格数
set tabstop=4  "tab代表4个空格
set laststatus=2 
" indent 删除自动缩进的值
" eol 删除上一行行末尾的回车，两行合并
" start 除了刚输入的，还删除原来的字符
set backspace=indent,eol,start
set expandtab "使用空格替换tab
set autoindent " 自动缩进
"color
colorscheme evening  "颜色模式
syntax on
colorscheme molokai
"===================单独颜色配置============
"33 表示注释段 guifg为颜色编码
hi Comment ctermfg=33 guifg=#ADFF2F     
"===========================================
"检测文件类型
filetype on
""针对不同的文件采取不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
""简化+寄存器操作
"set clipboard=unnamedplus
"启动智能补全
filetype plugin indent on

"键位映射
inoremap jj <esc>
inoremap #d #define
inoremap #in #include
inoremap #i #ifdef

