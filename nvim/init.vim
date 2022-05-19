:lua require('setup')

set foldmethod=indent
set foldlevel=99

" -------- Coc 配置 --------
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" 使用 tab 键切换提示
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" 使用回车完成提示
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" 跳转诊断
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
" 显示文档
nnoremap <silent> gh :call <SID>show_documentation()<CR>

" GoTo code navigation.
" 跳转定义
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
" Code Action
nmap ga  <Plug>(coc-codeaction)

" Symbol renaming.
" 重命名
nmap <leader>R <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>F  :Format<cr>
nmap <leader>F  :Format<cr>

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" text-object 扩展
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
" command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Mappings for CoCList
" 打开 coclist
nnoremap <silent><nowait> <leader>cl  :<C-u>CocList<CR>
nnoremap <silent><nowait> <leader>cs  :<C-u>CocSearch
" 恢复上一次的 list
nnoremap <silent><nowait> <leader>cr  :<C-u>CocListResume<cr>
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" 展示诊断
nnoremap <silent><nowait> <leader>cd  :<C-u>CocList diagnostics<cr>
" 命令
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" 搜索最近使用的文件列表
nnoremap <silent><nowait> <leader>cm  :<C-u>CocList mru<cr>
" 搜索当前文件中的单词
nnoremap <silent><nowait> <leader>cw  :<C-u>CocList words<cr>
" 搜索当前工作区中的文件
nnoremap <silent><nowait> <leader>cf  :<C-u>CocList files<cr>
" 搜索当前工作区中的文字
nnoremap <silent><nowait> <leader>cg  :<C-u>CocList grep<cr>
" 搜索大纲
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>

" Git
" navigate chunks of current buffer
nmap <leader>gk <Plug>(coc-git-prevchunk)
nmap <leader>gj <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap <leader>gp <Plug>(coc-git-prevconflict)
nmap <leader>gn <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap <leader>gi <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap <leader>gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" 多光标
nmap <silent> <C-n> <Plug>(coc-cursors-word)
xmap <silent> <C-n> <Plug>(coc-cursors-range)

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('gh', 'in')
  endif
endfunction

" 浮窗内滚动
nnoremap <expr> <C-d> coc#float#has_float() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <expr> <C-u> coc#float#has_float() ? coc#float#scroll(0) : "\<C-u>"

" 翻译
nmap <Leader>tt <Plug>(coc-translator-p)
vmap <Leader>tt <Plug>(coc-translator-pv)
" echo
nmap <Leader>te <Plug>(coc-translator-e)
vmap <Leader>te <Plug>(coc-translator-ev)
" replace
nmap <Leader>tr <Plug>(coc-translator-r)
vmap <Leader>tr <Plug>(coc-translator-rv)

