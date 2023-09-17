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

" 增量选择
nmap <silent> <CR> <Plug>(coc-range-select)
xmap <silent> <CR> <Plug>(coc-range-select)

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

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ge <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ge <Plug>(EasyAlign)

" for visual mode, the visually selected text
" Debugger
sign define vimspectorBP            text= texthl=WarningMsg
sign define vimspectorBPCond        text= texthl=WarningMsg
sign define vimspectorBPLog         text= texthl=SpellRare
sign define vimspectorBPDisabled    text= texthl=LineNr
sign define vimspectorPC            text=ﰴ texthl=MatchParen linehl=CursorLine
sign define vimspectorPCBP          text=ﰳ texthl=MatchParen linehl=CursorLine
sign define vimspectorCurrentThread text=ﰴ texthl=MatchParen linehl=CursorLine
sign define vimspectorCurrentFrame  text=ﰴ texthl=Special    linehl=CursorLine

let g:vimspector_sign_priority = {
  \    'vimspectorBP':         13,
  \    'vimspectorBPCond':     12,
  \    'vimspectorBPLog':      12,
  \    'vimspectorBPDisabled': 11,
  \    'vimspectorPC':         999,
  \ }

" command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
