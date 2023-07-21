local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  vim.notify("mason not found!")
  return
end
local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  vim.notify("mason not found!")
  return
end

local servers = {
  "lua_ls",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "jsonls",
  "yamlls",
  "volar",
  "emmet_ls",
  "esbonio"
}

mason.setup()
mason_lspconfig.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  vim.notify("mason-lspconfig not found!")
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("mcp.lsp.handlers").on_attach,
    capabilities = require("mcp.lsp.handlers").capabilities,
  }

  if server == "lua_ls" then
    local sumneko_opts = require "mcp.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  lspconfig[server].setup(opts)
end
