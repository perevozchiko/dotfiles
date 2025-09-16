-- LSP Cleanup utilities
local M = {}

-- Function to show active LSP clients with detailed info
function M.show_lsp_clients()
  local clients = vim.lsp.get_clients and vim.lsp.get_clients() or vim.lsp.get_active_clients()
  if #clients == 0 then
    print("No active LSP clients")
    return
  end
  
  print("Active LSP clients:")
  for _, client in pairs(clients) do
    print(string.format("- %s (id: %d)", client.name, client.id))
    if client.config and client.config.cmd then
      print(string.format("  Command: %s", table.concat(client.config.cmd, " ")))
    end
  end
end

-- Command to show LSP clients
vim.api.nvim_create_user_command('LspClients', M.show_lsp_clients, {})

-- Simple LSP restart command
vim.api.nvim_create_user_command('LspRestart', function()
  vim.cmd('LspStop')
  vim.defer_fn(function()
    vim.cmd('LspStart')
  end, 100)
  print("LSP restarted")
end, {})

return M
