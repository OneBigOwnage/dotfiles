require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = false,
  styles = {
    comments = {},
    loops = {},
    conditionals = {},
    functions = { },
    strings = {},
    keywords = {  },
  },
})

vim.o.termguicolors = true
vim.cmd.colorscheme("catppuccin")

-- Error/Warning highlight customizations
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true, sp = "red" })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true, sp = "#f9e2af" })


vim.api.nvim_set_hl(0, "@type.definition", { italic = true })
vim.api.nvim_set_hl(0, "TSType", { italic = true })

