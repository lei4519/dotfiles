HOME = vim.env.HOME
NVIMRC = HOME .. "/dotfiles/lvim"
DAP_INSTALL = HOME .. "/.local/share/nvim/dapinstall/"

local config_paths = {}

for item in require("io").popen("ls " .. NVIMRC .. "/lua"):lines() do
	-- 文件以 -- 开头表示注释，不加载插件
	if item.sub(item, 1, 2) ~= '--' and item ~= 'setup.lua' then
			-- 文件
			if item.sub(item, -4) == '.lua' then
					table.insert(config_paths, item.sub(item, 0, -5))
			else
					-- 目录，调用 /init.lua
					table.insert(config_paths, item)
			end
	end
end

-- 调用配置
for _, v in ipairs(config_paths) do
	local m = require(v);
	if type(m.setup) == 'function' then
		m.setup()
	end
	if type(m.config) == 'function' then
			m.config()
	end
end
