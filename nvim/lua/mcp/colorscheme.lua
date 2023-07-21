-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
local colorscheme = "tokyonight"
require("tokyonight").setup({
    style = "night"
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
