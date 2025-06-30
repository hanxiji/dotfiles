"********************文件类型检测开关设置********************
filetype plugin indent on
filetype on
" yaml文件检测
autocmd FileType yaml setlocal ai nu ru ts=2 sw=2 et
"********************设置编码********************
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"********************通用设置********************
" 关闭VI兼容模式
set nocompatible
" 显示行号
set number
" 突出显示当前行
set cursorline
" 突出显示当前列
"set cursorcolumn
" 总是显示状态栏
set laststatus=2
" 设置标尺
set ruler
" 括号匹配
set showmatch
" 显示输入命令
set showcmd
set nopaste
" paste这个选项会造成括号自动补全插件失效
"set paste 
" 使用鼠标
"set mouse=a
" 开启实时搜索
set incsearch
" 搜索时高亮
set hlsearch
" 搜索时大小写不敏感
set ignorecase
" 智能大小写搜索,在ignorecase选项开启时生效,根据搜索模式动态调整ignorecase功能
set smartcase
" vs分屏时默认在右边打开
set splitright
" 增强模式命令行补全，在命令行模式输入命令按下'wildchar'（默认tab）能够自动补全命令和参数，详情使用`:help wildmenu`查看
set wildmenu
set wildmode=list:longest,full
" 解决中文标点显示的问题
set ambiwidth=double
" 不自动折行
set nowrap

"********************标签栏设置********************
" 总是显示标签栏
set showtabline=2
" 打开标签数量限制
set tabpagemax=15
"********************标签栏设置********************

"********************编辑设置********************
"缩进符号
"set foldmarker={,}
"set foldmethod=indent
"set foldlevel=100
"设置tab制表符宽度为4
set tabstop=4
" 设置按tab时缩进宽度为4
set softtabstop=4
" 设置自动缩进宽度为4
set shiftwidth=4
" expandtab/noexpandtab：将 tab 扩展/不扩展成空格
set expandtab
" 根据文件中其他地方的缩进空格个数来确定一个tab是多少个空格
set smarttab
" 自动缩进
set autoindent
" 智能缩进
set smartindent
"set backspace=2
" 让退格符在插入模式下能够删除前一个字符，就像一般的编辑器那样
set backspace=indent,start,eol
" 退出插入模式指定类型的文件自动保存
"au InsertLeave *.go,*.sh write
" 在vim退出时提示保存所有文件
"set autowriteall

"****************************************plugs****************************************
call plug#begin('~/.vim/plugged')

" 主题颜色相关
"Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'    "状态栏
Plug 'mengelbrecht/lightline-bufferline'

" 编程通用
" 代码快速对齐
Plug 'junegunn/vim-easy-align'
" 树型目录
Plug 'preservim/nerdtree',{ 'on': 'NERDTreeToggle' }
" 文件标签展示,需安装ctags或者其他语言标签生成工具如gotags
"Plug 'preservim/tagbar'
" 括号自动补全
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
" 括号匹配染色
Plug 'luochen1990/rainbow'
" 代码缩进线条
Plug 'yggdroot/indentline'

" 文件模糊搜索fzf，vim-fzf插件需先安装fzf程序
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }   "该行会在vim插件安装目录中安装fzf程序，也可配置使用系统安装的fzf程序
Plug 'junegunn/fzf.vim'

" 代码补全相关
Plug 'neoclide/coc.nvim', {'branch': 'release'} "使用coc前需先安装nodejs

" Debuger
"Plug 'puremourning/vimspector'

" GoLang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" MarkDown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }, 'for': ['markdown', 'vim-plug'] }

" Buffer
"Plug 'bling/vim-bufferline'
"Plug 'jlanzarotta/bufexplorer'
call plug#end()

"lightline插件配置
let g:lightline = {'colorscheme': 'wombat',}
"let g:lightline = {
"      \ 'colorscheme': 'one',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'tabline': {
"      \   'left': [ ['buffers'] ],
"      \   'right': [ ['close'] ]
"      \ },
"      \ 'component_expand': {
"      \   'buffers': 'lightline#bufferline#buffers'
"      \ },
"      \ 'component_type': {
"      \   'buffers': 'tabsel'
"      \ }
"      \ }

"delimitMate插件配置
"let delimitMate_expand_cr = 1 "需要backspace包含start,eol
"let delimitMate_expand_space = 1 "需要backspace包含start,eol

"NERDTree插件配置
"在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1

"rainbow插件配置
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"fzf插件设置
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
"****************************************plugs****************************************

"****************************************颜色和主题****************************************
" 256色设置
set t_Co=256
" 开启24bit的颜色，开启这个颜色会更漂亮一些，命令行模式似乎不支持
"set termguicolors
" 代码高亮
syntax on
set background=dark
"colorscheme murphy
colorscheme gruvbox
"********************
" 标签栏设置
"********************
" 选中的tab颜色
hi SelectTabLine term=Bold cterm=Bold ctermfg=DarkYellow ctermbg=LightGray
hi SelectPageNum cterm=None ctermfg=DarkRed ctermbg=LightGray
hi SelectWindowsNum cterm=None ctermfg=DarkCyan ctermbg=LightGray
" 未选中状态的tab
hi NormalTabLine cterm=None ctermfg=Gray ctermbg=DarkGray
hi NormalPageNum cterm=None ctermfg=Gray ctermbg=DarkGray
hi NormalWindowsNum cterm=None ctermfg=Gray ctermbg=DarkGray
" tab栏背景色
hi TabLineFill term=reverse ctermfg=5 ctermbg=7 guibg=#6c6c6c

"****************************************颜色和主题****************************************

"********************自定义键盘映射********************
"定义快捷键的前缀，即<Leader>
"let mapleader=";"
"nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <F2> :NERDTree<CR>
nnoremap <F3> :NERDTreeToggle<CR>
"nnoremap <F4> :NERDTreeFind<CR>
"nnoremap <F6> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
"********************自定义键盘映射********************
