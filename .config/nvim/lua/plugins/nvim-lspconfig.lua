local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {"documentation", "detail", "additionalTextEdits"}
}

local function setup_servers()
  require "lspinstall".setup()
  local servers = require "lspinstall".installed_servers()
  for _, server in pairs(servers) do
    require "lspconfig"[server].setup {capabilities = capabilities}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

require("lspconfig").lua.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
}
