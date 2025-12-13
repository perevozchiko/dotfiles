require("nvchad.configs.lspconfig").defaults()

-- List of LSP servers to enable
local servers = {
  "clangd",      -- C/C++
  "lua_ls",      -- Lua
  "marksman",    -- Markdown
  "lemminx",     -- XML
}

vim.lsp.enable(servers)

-- clangd specific configuration
vim.lsp.config.clangd = {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
  root_markers = { ".clangd", ".clang-tidy", ".clang-format", "compile_commands.json", "compile_flags.txt", ".git" },
}

-- lua_ls specific configuration
vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },  -- Recognize 'vim' global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
} 
