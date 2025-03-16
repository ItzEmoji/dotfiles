return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.pairs").setup()
    require('mini.comment').setup()
    require('mini.surround').setup()
    require("mini.splitjoin").setup({
      mappings = {
        toggle = "<leader>gp",
      },
    })
    require("mini.move").setup()
  end,
}
