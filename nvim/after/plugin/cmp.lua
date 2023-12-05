local lspkind = require('lspkind')

require('cmp').setup({
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = lspkind.cmp_format({
      mode = 'symbol'
    }),
  },
})
