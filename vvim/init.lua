-- leader key 为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = "utf-8"
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 使用相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 缩进2个空格等于一个Tab
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 搜索不要高亮
vim.o.hlsearch = true
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为1，提供足够的显示空间
vim.o.cmdheight = 1
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = "<,>,[,]"
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a"
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = "menuone,noselect"
-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 是否显示不可见字符
vim.o.list = false
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.listchars = "space:·,tab:··"
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. "c"
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false
-- 配置剪切板
vim.opt.clipboard = "unnamedplus"

vim.opt.colorcolumn = "99999" -- fixes indentline for now
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
-- vim.opt.foldlevel = 99
-- vim.opt.foldmethod = "indent" -- folding set to "expr" for treesitter based folding
vim.opt.title = true -- set the title of window to the value of the titlestring
vim.opt.titlestring = "%<%F%=%l/%L - nvim" -- what the title of the window will be set to
vim.opt.undodir = vim.fn.stdpath "cache" .. "/undo"
vim.opt.undofile = true -- enable persistent undo
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = "yes" -- always show the sign column otherwise it would shift the text each time
vim.opt.spell = false
vim.opt.spelllang = "en"

vim.keymap.set('', 's', '<Plug>(easymotion-prefix)')
vim.keymap.set({'x', 'n', 'o'}, 'gc', '<Plug>VSCodeCommentary')
vim.keymap.set('n', 'gcc', '<Plug>VSCodeCommentaryLine')
vim.keymap.set('n', 'zo', '<Cmd>call VSCodeNotify(\'editor.unfold\')<CR>')
vim.keymap.set('n', 'zc', '<Cmd>call VSCodeNotify(\'editor.fold\')<CR>')

local plugins = {
  { "wbthomason/packer.nvim" },
  -- 驼峰格式转换 https://github.com/arthurxavierx/vim-caser
  { 'arthurxavierx/vim-caser' },
  -- 增强文本对象 https://github.com/wellle/targets.vim
  { 'wellle/targets.vim' },
  -- vim-surround
  {
    "tpope/vim-surround",
    event = "BufRead",
    keys = { "c", "d", "y" }
  },
  -- 使 . 可以在全局重复
  { "tpope/vim-repeat" },
  -- lightspeed 光标快速跳转
  {
    "asvetliakov/vim-easymotion",
    event = "BufRead",
  },
}

-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  packer_bootstrap = fn.system({ "git", "clone", "--depth", "1", -- "https://github.com/wbthomason/packer.nvim",
    "https://github.com/wbthomason/packer.nvim", install_path })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    for _, v in ipairs(plugins) do
      use(v)
    end

    if packer_bootstrap then
      packer.sync()
    end
  end,
})

local IM = {}

IM.defaultIM = "com.apple.keylayout.ABC"
-- IM.defaultIM = "com.apple.inputmethod.SCIM.Shuangpin"
IM.currentIM = IM.defaultIM

IM.InsertLeave = function()
  IM.currentIM = vim.fn.system({ "im-select" })
  vim.cmd(":silent :!im-select" .. " " .. IM.defaultIM)
end

IM.InsertEnter = function()
  if IM.currentIM then
    vim.cmd(":silent :!im-select" .. " " .. IM.currentIM)
  else
    vim.cmd(":silent :!im-select" .. " " .. IM.defaultIM)
  end
end


local myAutoGroup = vim.api.nvim_create_augroup("Lay", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- 切换输入法
autocmd("InsertEnter", {
  group = myAutoGroup,
  callback = IM.InsertEnter
})

autocmd("InsertLeave", {
  group = myAutoGroup,
  callback = IM.InsertLeave
})

