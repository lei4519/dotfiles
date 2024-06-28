return {
  "chrisgrieser/nvim-rip-substitute",
  -- config = function()
  --   require("rip-substitute").setup({
  --     regexOptions = {
  --       ---@type "case-sensitive"|"ignore-case"|"smart-case"
  --       casing = "smart-case",
  --     },
  --   })
  -- end,
  keys = {
    {
      "<localleader>s",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = " rip substitute",
    },
  },
}
