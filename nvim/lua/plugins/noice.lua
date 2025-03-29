return {
  "folke/noice.nvim",
  dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup()

    require("telescope").load_extension("noice")

    require("notify").setup({
      background_colour = "#000000",
    })
  end
}
