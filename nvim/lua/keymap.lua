-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


function L.set_terminal_mode_tt_keymap()
  vim.api.nvim_buf_set_keymap(0, 't', '<leader>tt', "<cmd>lua L.toggleA()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(0, 't', '<leader>tv', "<cmd>lua L.toggleB()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(0, 't', '<leader>th', "<cmd>lua L.toggleC()<cr>", { noremap = true })
  vim.api.nvim_buf_set_keymap(0, 't', '<leader>tg', "<cmd>lua L.toggleG()<cr>", { noremap = true })
end

vim.cmd('autocmd! TermOpen term://* lua L.set_terminal_mode_tt_keymap()')

local keys = {
  {
    { mode = "i" },
    {
      ["jf"] = { "<Esc>", "" },
      -- Move current line / block with Alt-j/k ala vscode.
      -- ["<A-j>"] = { "<Esc>:m .+1<CR>==gi", "" },
      -- -- Move current line / block with Alt-j/k ala vscode.
      -- ["<A-k>"] = { "<Esc>:m .-2<CR>==gi", "" },
      -- navigation
      ["<A-Up>"] = { "<C-\\><C-N><C-w>k", "" },
      ["<A-Down>"] = { "<C-\\><C-N><C-w>j", "" },
      ["<A-Left>"] = { "<C-\\><C-N><C-w>h", "" },
      ["<A-Right>"] = { "<C-\\><C-N><C-w>l", "" },
    }
  },
  {
    { mode = "n" },
    {
      ["]q"] = { ":cnext<CR>", "Next Quickfix" },
      ["[q"] = { ":cprev<CR>", "Prev Quickfix" },
      ['[d'] = { "<Plug>(coc-diagnostic-prev)", "Prev Diagnostics" },
      [']d'] = { "<Plug>(coc-diagnostic-next)", "Next Diagnostics" },
      ['[g'] = { "<Plug>(coc-git-prevchunk)", "Prev Git Chunk" },
      [']g'] = { "<Plug>(coc-git-nextchunk)", "Next Git Chunk" },
      ["ga"] = { "<Plug>(coc-codeaction)", "Code Action" },
      ["gd"] = { "<Plug>(coc-definition)", "Go Definition" },
      ["gt"] = { "<Plug>(coc-type-definition)", "Go Type Definition" },
      ["gi"] = { "<Plug>(coc-implementation)", "Implementation" },
      ["gr"] = { "<Plug>(coc-references)", "References" },
      ["gR"] = { "<Plug>(coc-refactor)", "Refactor" },
      ["gn"] = { "<Plug>(coc-rename)", "Rename" },
      ["gl"] = { "<Plug>(coc-codelens-action)", "Code Lens" },
      ['gp'] = {
        name = "Preview",
        d = {
          ":call CocAction('jumpDefinition', v:false)<CR>",
          "Peek Definition",
        },
        -- d = {
        --   "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
        --   "Peek Definition",
        -- },
        i = {
          "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
          "Preview Implementation",
        },
        r = {
          "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
          "Preview References",
        },
        m = {
          "<cmd>MarkdownPreviewToggle<CR>",
          "Markdown Preview Toggle",
        },
      },
      ['gP'] = {
        "<cmd>lua require('goto-preview').close_all_win()<CR>",
        "Close All Preview",
      },
      ['gs'] = {
        p = {
          "<Plug>CaserMixedCase",
          "PascalCase"
        },
        c = {
          "<Plug>CaserCamelCase",
          "camelCase"
        },
        ["_"] = {
          "<Plug>CaserSnakeCase",
          "snake_case"
        },
        u = {
          "<Plug>CaserUpperCase",
          "UPPER_CASE"
        },
        t = {
          "<Plug>CaserTitleCase",
          "Title Case"
        },
        s = {
          "<Plug>CaserSentenceCase",
          "Sentence case"
        },
        ["<space>"] = {
          "<Plug>CaserSpaceCase",
          "space case"
        },
        ["-"] = {
          "<Plug>CaserKebabCase",
          "kebab-case"
        },
        k = {
          "<Plug>CaserTitleKebabCase",
          "Title-Kebab-Case",
        },
        ["."] = {
          "<Plug>CaserDotCase",
          "dot.case"
        }
      },
      -- -- ????????????????????????
      -- ["<A-j>"] = { ":m .+1<CR>==", "" },
      -- ["<A-k>"] = { ":m .-2<CR>==", "" },
      -- ??????????????????
      ["<A-Up>"] = { ":resize -2<CR>", "" },
      ["<A-Down>"] = { ":resize +2<CR>", "" },
      ["<A-Left>"] = { ":vertical resize -2<CR>", "" },
      ["<A-Right>"] = { ":vertical resize +2<CR>", "" },
      -- $???????????????????????? (??????$ ??? g_)
      ["$"] = { "g_", "" },
      ["g_"] = { "$", "" },
      -- ??????Tab??????
      ["<C-h>"] = { ":BufferLineCyclePrev<CR>", "" },
      ["<C-l>"] = { ":BufferLineCycleNext<CR>", "" },
    }
  },
  {
    { mode = "v" },
    {
      -- visual?????????????????????
      ["<"] = { "<gv", "" },
      [">"] = { ">gv", "" },
      -- -- ????????????????????????
      -- ["A-j"] = { ":move '>+1<CR>gv-gv", "" },
      -- ["A-k"] = { ":move '<-2<CR>gv-gv", "" },
      -- ???visual mode ?????????????????????
      ["p"] = { '"_dP', "" },
      -- ["P"] = { '"_dP', "" },
      -- $???????????????????????? (??????$ ??? g_)
      ["$"] = { "g_", "" },
      ["g_"] = { "$", "" },
      ['gs'] = {
        p = {
          "<Plug>CaserVMixedCase",
          "PascalCase"
        },
        c = {
          "<Plug>CaserVCamelCase",
          "camelCase"
        },
        ["_"] = {
          "<Plug>CaserVSnakeCase",
          "snake_case"
        },
        u = {
          "<Plug>CaserVUpperCase",
          "UPPER_CASE"
        },
        t = {
          "<Plug>CaserVTitleCase",
          "Title Case"
        },
        gss = {
          "<Plug>CaserVSentenceCase",
          "Sentence case"
        },
        ["<space>"] = {
          "<Plug>CaserVSpaceCase",
          "space case"
        },
        ["-"] = {
          "<Plug>CaserVKebabCase",
          "kebab-case"
        },
        k = {
          "<Plug>CaserVTitleKebabCase",
          "Title-Kebab-Case",
        },
        ["."] = {
          "<Plug>CaserVDotCase",
          "dot.case"
        }
      },
    }
  },
  {
    { mode = "x" },
    {
      -- -- Move selected line / block of text in visual mode
      -- ["K"] = { ":move '<-2<CR>gv-gv", "" },
      -- ["J"] = { ":move '>+1<CR>gv-gv", "" },
      --
      -- -- Move current line / block with Alt-j/k ala vscode.
      -- ["<A-j>"] = { ":m '>+1<CR>gv-gv", "" },
      -- ["<A-k>"] = { ":m '<-2<CR>gv-gv", "" },
    }
  },
  {
    { mode = "t" },
    {
    }
  },
  {
    { mode = "c", expr = true, noremap = true, silent = false },
    {
      -- ???????????? Ctrl+j/k  ??????????????????
      ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', "" },
      ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', "" },
    }
  },
  -- {
  --   { mode = "t", prefix = "<leader>" },
  --   {
  --     t = {
  --       name = "Term",
  --       t = { L.toggleA, "Toggle Float Term" },
  --       v = { L.toggleB, "Toggle Vertical Term" },
  --       h = { L.toggleC, "Toggle Horizontal Term" },
  --       g = { L.toggleG, "LazyGit" },
  --     },
  --
  --   }
  -- },
  {

    { mode = "x", prefix = "<leader>" },
    {
      d = {
        name = "Debug",
        v = { "<Plug>VimspectorBalloonEval", "??????????????????????????????" },
      }
    }
  },
  {
    { mode = "n", prefix = "<leader>" },
    {
      [";"] = { "<cmd>Dashboard<CR>", "Dashboard" },
      ["/"] = { "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", "Comment" },
      ["<space>"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

      q = { require('utils').smart_quit, "Quit" },
      c = { ":Bdelete!<CR>", "Close Buffer" },
      b = {
        name = "Buffers",
        j = { "<cmd>BufferLinePick<cr>", "Jump" },
        f = { "<cmd>Telescope buffers<cr>", "Find" },
        b = { "<cmd>BufferLineCyclePrev<cr>", "Previous" },
        -- w = { "<cmd>BufferWipeout<cr>", "Wipeout" }, -- TODO: implement this for bufferline
        e = {
          "<cmd>BufferLinePickClose<cr>",
          "Pick which buffer to close",
        },
        h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
        l = {
          "<cmd>BufferLineCloseRight<cr>",
          "Close all to the right",
        },
        o = { "<cmd>BufferLineCloseRight<cr><cmd>BufferLineCloseLeft<cr>", "Close Other" },
        D = {
          "<cmd>BufferLineSortByDirectory<cr>",
          "Sort by directory",
        },
        L = {
          "<cmd>BufferLineSortByExtension<cr>",
          "Sort by language",
        },
      },

      d = {
        name = "Debug",
        c = { "<Plug>VimspectorContinue", "?????????????????????" },
        r = { "<Plug>VimpectorRestart", "VimspectorReset" },
        e = { ":call vimspector#Stop()<cr><cmd>VimspectorReset<cr>", "????????????" },
        p = { "<Plug>VimspectorPause", "????????????" },
        R = { "<Plug>VimspectorGoToCurrentLine", "??????????????????????????????????????????" },


        w = { "<Plug>VimspectorBreakpoints", "??????????????????" },
        b = { "<Plug>VimspectorUpFrame", "????????????????????????????????????" },
        f = { "<Plug>VimspectorDownFrame", "????????????????????????????????????" },

        v = { "<Plug>VimspectorBalloonEval", "??????????????????????????????" },

        t = { "<Plug>VimspectorToggleBreakpoint", "??????????????????????????????" },
        T = { "<Plug>VimspectorToggleConditionalBreakpoint", "?????????????????????????????????????????????" },
        a = { "<Plug>VimspectorAddFunctionBreakpoint", "??????????????????????????????????????????" },
        x = { ":call vimspector#ClearBreakpoints()<cr>", "??????????????????" },

        d = { "<Plug>VimspectorStepOver", "??????" },
        D = { "<Plug>VimspectorRunToCursor", "???????????????" },
        i = { "<Plug>VimspectorStepInto", "??????" },
        o = { "<Plug>VimspectorStepOut", "????????????????????????" },
      },

      e = { "<Cmd>CocCommand explorer<CR>", "Explorer" },

      f = {
        name = "Find",
        f = { ":Files<cr>", "File" },
        g = { ":Ag<cr>", "Ag" },
        h = { ":History<cr>", "History" },
        c = { ":CocFzfList commands<cr>", "CocCommand" },
        l = { ":CocFzfList<cr>", "CocFzfList" },
        e = { ":CocConfig<cr>", "CocConfig" },
        d = { ":CocFzfList diagnostics --current-buf<cr>", "Buffer Diagnostics" },
        D = { "<Cmd>lua L.diagnostic()<CR>", "diagnostics" },
        w = { ":CocFzfList words<cr>", "words" },
        o = { ":CocFzfList outline<cr>", "outline" },
      },

      g = {
        name = "Git",
        y = { ":CocCommand git.copyUrl<cr>", "Copy url of current line to clipboard" },
        i = { ":CocCommand git.chunkInfo<cr>", "Show chunk info under cursor." },
        u = { ":CocCommand git.chunkUndo<cr>", "Undo current chunk." },
        s = { ":CocCommand git.chunkStage<cr>", "Stage current chunk." },
        S = { ":CocCommand git.chunkUnstage<cr>", "Unstage chunk that contains current line." },
        d = { ":CocCommand git.diffCached<cr>", "Show cached diff in preview window." },
        c = { ":CocCommand git.showCommit<cr>", "Show commit of current chunk." },
        o = { ":CocCommand git.browserOpen<cr>", "Open current line in browser" },
        f = { ":CocCommand git.foldUnchanged<cr>", "Fold unchanged lines of current buffer." },
        g = { ":CocCommand git.toggleGutters<cr>", "Toggle git gutters in sign column." },
        p = { ":CocCommand git.push<cr>", "push code of current branch to remote." },
      },

      -- ????????????
      h = { "<C-w>h", "Move Right Window" },
      j = { "<C-w>j", "Move Down Window" },
      k = { "<C-w>k", "Move Up Window" },
      l = { "<C-w>l", "Move Left Window" },

      n = { "<CMD>ene!<CR>", "New File" },

      -- SymbolOutLine
      o = { L.CocOutLineToggle, "Symbols Outline" },

      p = {
        name = "Packer",
        c = { "<cmd>PackerCompile<cr>", "Compile" },
        i = { "<cmd>PackerInstall<cr>", "Install" },
        r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
        s = { "<cmd>PackerSync<cr>", "Sync" },
        S = { "<cmd>PackerStatus<cr>", "Status" },
        u = { "<cmd>PackerUpdate<cr>", "Update" },
      },

      -- ????????????
      r = {
        "<cmd>RnvimrToggle<CR>", "ranger"
      },

      -- ????????????
      s = {
        name = "Search And Replace",
        s = { ":s/\\v", "Search Line" },
        g = { ":%s/\\v", "Search Global" },
        b = { ":.,0s/\\v", "Search Before" },
        a = { ":.,$s/\\v", "Search After" },
        o = { "<cmd>lua require('spectre').open_visual()<cr>", "Open Search Panel" },
        w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Search Current Word" },
        c = { "<cmd>lua require('spectre').open_file_search()<cr>", "Search Current File" },
      },

      -- session ??????
      S = {
        name = "Session",
        c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
        l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
        Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
      },

      -- ????????????
      t = {
        name = "Term",
        t = { L.toggleA, "Toggle Float Term" },
        v = { L.toggleB, "Toggle Vertical Term" },
        h = { L.toggleC, "Toggle Horizontal Term" },
        g = { L.toggleG, "LazyGit" },
      },
      w = {
        name = "Window & Workspace",
        v = { ":vsp<cr>", "Split Vertical" },
        h = { ":sp<cr>", "Split Horizontal" },
        c = { "<c-w>c", "Close current" },
        o = { "<c-w>o", "Close Other" },
        ['='] = { "<c-w>=", "Change Average" },
      },
    }
  },
  {
    { mode = "v", prefix = "<leader>" },
    {
      ["/"] = { "<ESC><CMD>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
      s = {
        name = "Search And Replace",
        o = { "<cmd>lua require('spectre').open_visual()<cr>", "Search Selected" }
      }
    }
  }
}

return keys
