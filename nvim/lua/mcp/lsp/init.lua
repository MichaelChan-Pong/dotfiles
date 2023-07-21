local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "mcp.lsp.lsp-installer"
require("mcp.lsp.handlers").setup()
