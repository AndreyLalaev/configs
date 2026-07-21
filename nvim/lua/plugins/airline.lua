return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = 'vscode',
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', {'diagnostics', icons_enabled = false}},
        lualine_c = {{'filename', path = 1}},
        lualine_x = {'encoding', {'fileformat', icons_enabled = false}, 'filetype'},
        lualine_y = {},
        lualine_z = {"%l/%L:%v"}
      },

      tabline = {
          lualine_a = {''},
          lualine_b = {''},
          lualine_c = {
            {
              'buffers',
              show_filename_only = false,
              mode = 4, -- Shows buffer name + buffer number
              buffers_color = {
                active = function(section)
                  if vim.bo.modified then
                    local c = require('vscode.colors').get_colors()
                    return {fg = "#000000", bg = c.vscDarkYellow}
                  end
                  return 'lualine_a_normal'
                end,

                inactive = function(section)
                  local c = require('vscode.colors').get_colors()
                  return {c.vscGray}
                end,
              },
            }
          },
          lualine_x = {},
          lualine_y = {},
          lualine_z = {''}
      },
    }
  }
}
