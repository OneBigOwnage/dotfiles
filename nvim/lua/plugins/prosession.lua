return {
  "dhruvasagar/vim-prosession",
  dependencies = {
    "tpope/vim-obsession",
  },
  config = function()
    require('telescope').load_extension('prosession')
  end
}
