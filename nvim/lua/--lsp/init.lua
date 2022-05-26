local M = {}

local function config()

end

M.setup = function(use)
    -- 语言安装
    -- Lspconfig
    use {"williamboman/nvim-lsp-installer", {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp.setup")
            require("plugins.lsp.ui")
        end
    }}

    -- 补全引擎
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.lsp.cmp")
        end
    }
    -- Snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    -- require("plugins.lsp.formatter")
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("plugins.lsp.null-ls")
        end
    })
    -- TypeScript 增强
    use({
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        requires = "nvim-lua/plenary.nvim"
    })
    -- Lua 增强
    use("folke/lua-dev.nvim")
    -- JSON 增强
    use("b0o/schemastore.nvim")
    -- Rust 增强
    use("simrat39/rust-tools.nvim")
end

return M
