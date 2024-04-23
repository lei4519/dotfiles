
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"   silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
" " ---- 自动安装Vim Plug ----
"
" " ---- vim 设置区域 ----
" inoremap jf <esc>
" set relativenumber
" set clipboard=unnamedplus
" set clipboard=unnamed
" set cursorline
" set linespace=5
" set guifont=MesloLGS\ NF:h14 " 与iterm p10x保持一致
" " ---- vim 设置区域 ----
"
" " ---- neovide 配置 ----
" " let g:neovide_refresh_rate=60 " 屏幕刷新率
" " let g:neovide_transparency=1 " 透明度
" " ---- neovide 配置 ----
"
" " ---- 安装插件 ----
call plug#begin('~/.vim/plugged')
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc
" Plug 'kevinhwang91/rnvimr' " 悬浮窗口中使用 ranger
" Plug 'yamatsum/nvim-cursorline' " 光标下划线
" Plug 'brooth/far.vim' " 窗口预览的全文替换
" Plug 'nvim-lualine/lualine.nvim' " 状态栏
" Plug 'kyazdani42/nvim-web-devicons' " 文件目录图标
" Plug 'nvim-lua/plenary.nvim' " todo 注释
" Plug 'folke/todo-comments.nvim' " todo 注释
" Plug 'rust-lang/rust.vim', { 'for': 'rust' } " rust
" Plug 'terryma/vim-multiple-cursors' " 多光标
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " 模糊搜索
" Plug 'junegunn/fzf.vim' " 同上
" Plug 'preservim/nerdtree' " 目录树
" " Plug 'tpope/vim-fugitive' " git
" " Plug 'christoomey/vim-conflicted' " git diff
" Plug 'kshenoy/vim-signature' " mark 标记显示
" Plug 'tpope/vim-surround' " 环绕修改
" " Plug 'mg979/vim-xtabline' " 导航栏
" Plug 'glepnir/dashboard-nvim' " 启动页
" Plug 'junegunn/vim-easy-align' " 对齐
" Plug 'numToStr/Comment.nvim' " 快捷注释
" --- 主题 ---
" Plug 'yonlu/omni.vim' " https://github.com/yonlu/omni.vim
" Plug 'dracula/vim', { 'as': 'dracula' } " https://draculatheme.com/vim
" Plug 'catppuccin/nvim', {'as': 'catppuccin'} " https://github.com/catppuccin/nvim
" Plug 'olimorris/onedarkpro.nvim' " https://github.com/olimorris/onedarkpro.nvim
" Plug 'luisiacc/gruvbox-baby', {'branch': 'main'} " https://github.com/luisiacc/gruvbox-baby
" Plug 'tiagovla/tokyodark.nvim' " https://github.com/tiagovla/tokyodark.nvim
" --- 主题 ---
 call plug#end()
" " ---- 安装插件 ----
"
" " ---- lua 插件启动 ----
" lua require('Comment').setup()
" lua require('todo-comments').setup()
" lua require('lualine').setup()
" " ---- lua 插件启动 ----
"
" " ---- dashboard 配置 ----
" let g:dashboard_default_executive='fzf'
" autocmd VimEnter * Dashboard
" " ---- dashboard 配置 ----
"
"
" " ---- 主题配置 ----
" colorscheme dracula
"
" " ---- 主题配置 ----
"
" " ---- 自动安装coc插件----
" " let g:coc_global_extensions = [
" 			\ 'coc-marketplace',
" 			\ 'coc-translator',
" 			"\ 'coc-vimlsp',
" 			"\ 'coc-git',
" 			\ 'coc-rust-analyzer',
" 			\ 'coc-toml',
" 			"\ ]
" 			" \ 'coc-json',
" 			" \ 'coc-html',
" 			" \ 'coc-css',
" 			" \ 'coc-cssmodules',
" 			" \ 'coc-tailwindcss',
" 			" \ 'coc-tsserver',
" 			" \ 'coc-eslint',
" 			" \ 'coc-prettier',
" " ---- 自动安装coc插件----
"
" " ---- coc.vim 配置 ----
" " Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" " unicode characters in the file autoload/float.vim
" set encoding=utf-8
"
" " TextEdit might fail if hidden is not set.
" set hidden
"
" " Some servers have issues with backup files, see #649.
" set nobackup
" set nowritebackup
"
" " Give more space for displaying messages.
" set cmdheight=2
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
" set updatetime=300
"
" " Don't pass messages to |ins-completion-menu|.
" set shortmess+=c
"
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
" if has("nvim-0.5.0") || has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
"   set signcolumn=yes
" endif
"
" " Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
" inoremap <silent><expr> <cr> "\<c-g>u\<CR>"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" " Use <c-space> to trigger completion.
" if has('nvim')
"   inoremap <silent><expr> <c-space> coc#refresh()
" else
"   inoremap <silent><expr> <c-@> coc#refresh()
" endif
"
" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"
" " Use `[g` and `]g` to navigate diagnostics
" " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" " ---- coc.vim 配置 ----
"
" " ---- NERDTree 配置 ----
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
"
" " 启动时打开目录并将光标放在另一个窗口
" autocmd VimEnter * NERDTree
"
" " 如果目录是存在的最后一个窗口，则退出vim
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" " ---- NERDTree 配置 ----
