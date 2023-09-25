local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local lspconfig = require "lspconfig"

local servers = {
  "jsonls",
  "tsserver",
  "pyright",
  "graphql",
  "gopls",
  "rust_analyzer",
}

lsp_installer.setup({
  ensure_installed = servers,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})

for _, server in pairs(servers) do
  local opts = {
    on_attach = require "akira.lsp.handlers".on_attach,
    capabilities = require "akira.lsp.handlers".capabilities,
  }
  local has_custom_opts, server_custom_opts = pcall(require, "akira.lsp.settings." .. server)
  if has_custom_opts then
    opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
  end
  lspconfig[server].setup(opts)
end