return {
  "nvim-pack/nvim-spectre",
  enabled = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  -- keys = {
  --   {
  --     "<leader>sr",
  --     function()
  --       require("spectre").open({
  --         is_insert_mode = true,
  --         cwd = vim.fn.getcwd(),
  --         search_text = "",
  --         replace_text = "",
  --         path = "",
  --         is_close = true, -- close an exists instance of spectre and open new
  --       })
  --     end,
  --     desc = "Replace in files (Spectre)",
  --   },
  -- },
}
