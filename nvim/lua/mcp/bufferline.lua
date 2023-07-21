vim.opt.termguicolors = true

local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
    return
end

bufferline.setup({
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    mode = 'tabs',
    diagnostics = 'nvim_lsp',
    show_close_icon = false,
    sort_by = 'tabs',
  },
})
