local M = {}

local function config()
    -- vim.g.dashboard_default_executive = "telescope"
    -- vim.g.dashboard_custom_footer = { "" }
    vim.g.dashboard_custom_section = {
        a = {
            description = {"  SessionList          "},
            command = "SessionManager load_session"
        },
        b = {
            description = {"  LastSession           "},
            command = "SessionManager load_last_session"
        },
        c = {
            description = {"  Recently files        "},
            command = "Telescope oldfiles"
        },
        d = {
            description = {"  Edit keybindings      "},
            command = "edit ~/.config/nvim/lua/keybindings.lua"
        },
        e = {
            description = {"  Edit Projects         "},
            command = "edit ~/.local/share/nvim/project_nvim/project_history"
        },
        -- f = { description = { "  Edit .bashrc          " }, command = "edit ~/.bashrc" },
        -- g = { description = { "  Change colorscheme    " }, command = "ChangeColorScheme" },
        h = {
            description = {"  Edit init.lua         "},
            command = "edit ~/.config/nvim/init.lua"
        }
        -- i = { description = {'  Find file          '}, command = 'Telescope find_files'},
        -- j = { description = {'  Find text          '}, command = 'Telescope live_grep'},
    }

    vim.g.dashboard_custom_header =
        {[[███╗   ██╗███████╗██╗  ██╗███████╗███╗   ██╗]],
         [[████╗  ██║██╔════╝██║  ██║██╔════╝████╗  ██║]],
         [[██╔██╗ ██║███████╗███████║█████╗  ██╔██╗ ██║]],
         [[██║╚██╗██║╚════██║██╔══██║██╔══╝  ██║╚██╗██║]],
         [[██║ ╚████║███████║██║  ██║███████╗██║ ╚████║]],
         [[╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝]]}

    vim.g.dashboard_custom_header = {[[          ▀████▀▄▄              ▄█ ]],
                                     [[            █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█ ]],
                                     [[    ▄        █          ▀▀▀▀▄  ▄▀  ]],
                                     [[   ▄▀ ▀▄      ▀▄              ▀▄▀  ]],
                                     [[  ▄▀    █     █▀   ▄█▀▄      ▄█    ]],
                                     [[  ▀▄     ▀▄  █     ▀██▀     ██▄█   ]],
                                     [[   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █  ]],
                                     [[    █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀  ]],
                                     [[   █   █  █      ▄▄           ▄▀   ]]}

end

function M.setup(use)
    -- dashboard-nvim
    use {"glepnir/dashboard-nvim", config = config}
end

return M
