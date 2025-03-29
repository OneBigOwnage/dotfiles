return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local colors = {
      color2   = '#161821',
      color3   = '#b4be82',
      color4   = '#6b7089',
      color5   = '#2e313f',
      color8   = '#e2a478',
      color9   = '#3e445e',
      color10  = '#0f1117',
      color11  = '#17171b',
      color12  = '#818596',
      color15  = '#84a0c6',
    }

    local theme = {
      visual = {
        a = { fg = colors.color2, bg = colors.color3, gui = 'bold' },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      replace = {
        a = { fg = colors.color2, bg = colors.color8, gui = 'bold' },
        b = { fg = colors.color4, bg = colors.color5 },
      },
      inactive = {
        c = { fg = colors.color9, bg = colors.color10 },
        a = { fg = colors.color9, bg = colors.color10, gui = 'bold' },
        b = { fg = colors.color9, bg = colors.color10 },
      },
      normal = {
        c = { fg = colors.color4, bg = colors.color10 },
        a = { fg = colors.color4, bg = colors.color10 },
        b = { fg = colors.color4, bg = colors.color10 },
      },
      insert = {
        a = { fg = colors.color2, bg = colors.color15, gui = 'bold' },
        b = { fg = colors.color4, bg = colors.color5 },
      },
    }


    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = "εé▒", right = "εé│" },
        section_separators = { left = "εé▒", right = "εé│" },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = { 'location' }
      },
    }
  end
}
