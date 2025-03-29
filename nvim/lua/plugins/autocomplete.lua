return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "onsails/lspkind-nvim",
  },
  config = function()
    local lspkind = require('lspkind')
    local cmp = require('cmp')

    cmp.setup({
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = lspkind.cmp_format({
          mode = 'symbol',
          symbol_map = { Copilot = "∩äô" }
        }),
      },
      sources = {
        { name = "copilot",  group_index = 1 },
        { name = "nvim_lsp", group_index = 1 },
        { name = "path",     group_index = 2 },
        { name = "buffer",   group_index = 2 },
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = false }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      }),
      experimental = {
        ghost_text = true,
      },
    })

    vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
  end
}
