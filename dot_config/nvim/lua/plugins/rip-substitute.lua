return {
  "chrisgrieser/nvim-rip-substitute",
  enabled = false,
  config = function()
    require("rip-substitute").setup({
      popupWin = {
        -- border = "single",
        -- matchCountHlGroup = "Keyword",
        -- noMatchHlGroup = "ErrorMsg",
        -- hideSearchReplaceLabels = false,
        position = "top", -- "top"|"bottom"
      },
      -- regexOptions = {
      --   ---@type "case-sensitive"|"ignore-case"|"smart-case"
      --   casing = "smart-case",
      -- },
    })
  end,
  keys = {
    {
      "gS",
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = " rip substitute",
    },
  },
}
