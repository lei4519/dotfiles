-- bootstrap lazy.nvim, LazyVim and your plugins
local function get_os()
  local handle = io.popen("uname -s", "r")
  local ostype = handle:read("*a") -- 读取全部输出
  handle:close()

  return ostype
end

-- 调用函数获取当前操作系统
local current_os = get_os()
IS_MAC = current_os == "MacOS"
IS_LINUX = current_os == "Linux"

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.g.neovide_transparency = 1
  -- vim.opt.linespace = 1
  vim.g.neovide_transparency = 0.9

  if IS_MAC then
    vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
    vim.keymap.set("v", "<D-c>", '"+y') -- Copy
    vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
    vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
    vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
    vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

    -- Allow clipboard copy paste in neovim
    vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

    -- Add keybinds to change transparency
    local change_transparency = function(delta)
      vim.g.neovide_transparency = vim.g.neovide_transparency + delta
    end
    vim.keymap.set({ "n", "v", "o" }, "<D-]>", function()
      change_transparency(0.01)
    end)
    vim.keymap.set({ "n", "v", "o" }, "<D-[>", function()
      change_transparency(-0.01)
    end)
  else
    vim.keymap.set("n", "<C-s>", ":w<CR>") -- Save
    vim.keymap.set("v", "<C-c>", '"+y') -- Copy
    vim.keymap.set("n", "<C-v>", '"+P') -- Paste normal mode
    vim.keymap.set("v", "<C-v>", '"+P') -- Paste visual mode
    vim.keymap.set("c", "<C-v>", "<C-R>+") -- Paste command mode
    vim.keymap.set("i", "<C-v>", '<ESC>l"+Pli') -- Paste insert mode

    -- Allow clipboard copy paste in neovim
    vim.api.nvim_set_keymap("", "<C-v>", "+p<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("v", "<C-v>", "<C-R>+", { noremap = true, silent = true })
  end
end

require("config.lazy")
