:lua require('setup')

" -------- Coc 配置 --------
" 使用 tab 键切换提示
inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<C-j>" :
      \ coc#refresh()
inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Use K to show documentation in preview window.
" 显示文档
nnoremap <silent> gh :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('gh', 'in')
  endif
endfunction


" Formatting selected code.
xmap gf  :Format<cr>
nmap gf  :Format<cr>
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" text-object 扩展
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <CR> <Plug>(coc-range-select)
xmap <silent> <CR> <Plug>(coc-range-select)

" Mappings for CoCList
" 打开 coclist
nnoremap <silent><nowait> <leader>fl  :<C-u>CocList<CR>
nnoremap <silent><nowait> <leader>fs  :<C-u>CocSearch
" 恢复上一次的 list
nnoremap <silent><nowait> <leader>fr  :<C-u>CocListResume<cr>
nnoremap <silent><nowait> <leader>fj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <leader>fk  :<C-u>CocPrev<CR>
" 展示诊断
nnoremap <silent><nowait> <leader>fd  :<C-u>CocList diagnostics<cr>
" 命令
nnoremap <silent><nowait> <leader>fc  :<C-u>CocList commands<cr>
" 搜索最近使用的文件列表
nnoremap <silent><nowait> <leader>fm  :<C-u>CocList mru<cr>
" 搜索当前文件中的单词
nnoremap <silent><nowait> <leader>fw  :<C-u>CocList words<cr>
" 搜索当前工作区中的文件
nnoremap <silent><nowait> <leader>ff  :<C-u>CocList files<cr>
" 搜索当前工作区中的文字
nnoremap <silent><nowait> <leader>fg  :<C-u>CocList grep<cr>
" 搜索大纲
nnoremap <silent><nowait> <leader>fo  :<C-u>CocList outline<cr>

" 多光标
nmap <silent> <C-n> <Plug>(coc-cursors-word)
xmap <silent> <C-n> <Plug>(coc-cursors-range)

" 浮窗内滚动
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"

" 翻译
nmap <C-t> <Plug>(coc-translator-p)
vmap <C-t> <Plug>(coc-translator-pv)
" " echo
" nmap <Leader>te <Plug>(coc-translator-e)
" vmap <Leader>te <Plug>(coc-translator-ev)
" " replace
" nmap <Leader>tr <Plug>(coc-translator-r)
" vmap <Leader>tr <Plug>(coc-translator-rv)

