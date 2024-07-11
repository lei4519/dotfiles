-- copy from lazyvim lazyvim/plugins/extras/util/chezmoi.lua
local pick_chezmoi = function()
  if LazyVim.pick.picker.name == "telescope" then
    require("telescope").extensions.chezmoi.find_files()
  elseif LazyVim.pick.picker.name == "fzf" then
    local fzf_lua = require("fzf-lua")
    local results = require("chezmoi.commands").list()
    local chezmoi = require("chezmoi.commands")

    local opts = {
      fzf_opts = {},
      fzf_colors = true,
      actions = {
        ["default"] = function(selected)
          chezmoi.edit({
            targets = { "~/" .. selected[1] },
            args = { "--watch" },
          })
        end,
      },
    }
    fzf_lua.fzf_exec(results, opts)
  end
end

return {
  "ibhagwan/fzf-lua",
  keys = {
    -- 交换 root & cwd keymap
    { "<leader>/", LazyVim.pick("live_grep", { root = false }), desc = "Grep (Root Dir)" },
    { "<leader><space>", LazyVim.pick("auto", { root = false }), desc = "Find Files (Root Dir)" },
    -- find
    { "<leader>fF", LazyVim.pick("auto"), desc = "Find Files (Root Dir)" },
    { "<leader>ff", LazyVim.pick("auto", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>fc", pick_chezmoi, desc = "Find Config File" },
    { "<leader>fR", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
    { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
    -- search
    { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
    { "<leader>sW", LazyVim.pick("grep_cword"), desc = "Word (Root Dir)" },
    { "<leader>sw", LazyVim.pick("grep_cword", { root = false }), desc = "Word (cwd)" },
    { "<leader>sW", LazyVim.pick("grep_visual"), mode = "v", desc = "Selection (Root Dir)" },
    { "<leader>sw", LazyVim.pick("grep_visual", { root = false }), mode = "v", desc = "Selection (cwd)" },
  },
}
