set runtimepath+=~/.vim
set nocompatible              " be iMproved, required
filetype off                  " required
let g:vundle_default_git_proto = 'git'
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/CtrlP.vim
set rtp+=~/.vim/bundle/taglist-plus
set rtp+=~/.vim/bundle/Syntastic
set rtp+=~/.vim/bundle/TaskList.vim
set rtp+=~/.vim/bundle/nerdtree
set rtp+=~/.vim/bundle/YouCompleteMe
set rtp+=~/.vim/bundle/vim-powerline
set rtp+=~/.vim/bundle/Mark
set rtp+=~/.vim/plugin
set rtp+=~/.vim/bundle/Gundo 


call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"插件管理
Bundle 'VundleVim/Vundle.vim'
"侧边窗口插件
Bundle 'taglist-plus'
"信息标记
Bundle 'TaskList.vim'
"语法检查插件
Bundle 'Syntastic'
"自动填充插件
Bundle 'Valloric/YouCompleteMe'
"文件检索插件
Bundle 'CtrlP.vim'
"资源管理器
Bundle 'scrooloose/nerdtree'
"条带
Bundle 'Lokaltog/vim-powerline'
"高亮
Bundle 'Mark'
"撤销
Bundle 'Gundo'

"*****************************************************
"                Gundo配置                            *
"*****************************************************
nmap ,. :GundoToggle<CR>
"*****************************************************
"                CtrlP配置                            *
"*****************************************************
let g:ctrlp_working_path_mode = '0'       "disable work path mode
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"Press <F5> to purge the cache for the current directory to get new files,
"remove deleted files and apply new ignore options.
"Press <c-f> and <c-b> to cycle between modes.
"Press <c-d> to switch to filename only search instead of full path.
"Press <c-r> to switch to regexp mode.
"Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new
"split.
"Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"Use <c-y> to create a new file and its parent directories.
"Use <c-z> to mark/unmark multiple files and <c-o> to open them.
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
"\r
"*****************************************************
"            TaskList配置                            *
"*****************************************************
inoremap mk #TODO
map <silent>tl <Plug>TaskList
"*****************************************************
"           powerline配置                            *
"*****************************************************
"set nocompatible
set t_Co=256
set laststatus=2
""let g:Powerline_symbols = 'fancy'
"*****************************************************
"             taglist配置                            *
"*****************************************************
" 按F8按钮，在窗口的左侧出现taglist的窗口,像vc的左侧的workpace
nnoremap <silent> <F8> :TlistToggle<CR><CR>
" :Tlist              调用TagList
let Tlist_Show_One_File=0                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠

let Tlist_Ctags_Cmd ='/usr/local/bin/ctags'
"*****************************************************
"           Syntastic配置                            *
"*****************************************************
let g:syntastic_check_on_open = 1
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
"whether to show balloons
let g:syntastic_enable_balloons = 1
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
nnoremap <silent> <F9> :NERDTreeToggle<CR>
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
nnoremap <silent> jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0   
"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files = 1 
"静态检查
map <F6> : YcmDiags<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
let g:syntastic_always_populate_loc_list = 1
"语义补全
let g:ycm_key_invoke_completion = '<F7>'
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
""在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0


"*****************************************************
"                   ctags配置                        *
"*****************************************************
set tags=tags;    "   其中 ; 不能没有
set nocscopeverbose "duplicate cscope database not added 解决方法"
"set autochdir

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
filetype on 
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
inoremap jk <esc>
inoremap #d #define
inoremap #in #include
inoremap #i #ifdef

