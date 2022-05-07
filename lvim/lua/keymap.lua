local M = {}

function M.config()

  lvim.keys.insert_mode = {
    -- 'jk' for quitting insert mode
    ["jf"] = "<ESC>",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
    -- navigation
    ["<A-Up>"] = "<C-\\><C-N><C-w>k",
    ["<A-Down>"] = "<C-\\><C-N><C-w>j",
    ["<A-Left>"] = "<C-\\><C-N><C-w>h",
    ["<A-Right>"] = "<C-\\><C-N><C-w>l",
  }

	-- 项目管理
	lvim.builtin.which_key.mappings["p"] = {
		"<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects"
	}

	-- session 管理
	lvim.builtin.which_key.mappings["S"]= {
    name = "Session",
    c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
    l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
    Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
  }

	-- Ctrl + G: lazygit
	lvim.builtin.terminal.execs[#lvim.builtin.terminal.execs+1] = { "lazygit", "<c-g>", "LazyGit", "float" }

	lvim.builtin.which_key.mappings["t"] = {
		name = "Diagnostics",
		t = { "<cmd>TroubleToggle<cr>", "trouble" },
		w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "workspace" },
		d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "document" },
		q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
		l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
		r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
	}

  lvim.builtin.which_key.mappings["f"] = {
		name = "Telescope",
		-- f = { "<cmd>Telescope find_files<cr>", "find_files" },
    -- lunarvim 的配置，在 git repo 中使用 git_files，否则使用 fine_files
		f = lvim.builtin.which_key.mappings["f"],
		l = { "<cmd>Telescope live_grep<cr>", "live_grep" },
		b = { "<cmd>Telescope buffers<cr>", "buffers" },
		m = { "<cmd>Telescope marks<cr>", "marks" },
		g = { "<cmd>Telescope git_status<cr>", "git_status" },
		o = { "<cmd>Telescope oldfiles<cr>", "oldfiles" },
		q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
		c = { "<cmd>Telescope commands<cr>", "commands" },
		p = { "<cmd>Telescope<cr>", "Telescope" },
	}
end

return M