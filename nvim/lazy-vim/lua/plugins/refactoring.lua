return {
  "ThePrimeagen/refactoring.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    prompt_func_return_type = {
      go = true,
      java = false,
      cpp = true,
      c = true,
      h = false,
      hpp = false,
      cxx = false,
    },
    prompt_func_param_type = {
      go = true,
      java = false,
      cpp = true,
      c = true,
      h = false,
      hpp = false,
      cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
    show_success_message = true,
  },
}
