vim.cmd [[
try
  colorscheme darkplus
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

-- material settings
vim.g.material_style = "darker"

-- onedark settings
require('onedark').setup {
  style = 'darker'
}
