-- LSP configuration
return {
  -- Mason for managing LSP servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },

  -- Mason-lspconfig for Mason integration with lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",        -- C/C++
          "pylsp",         -- Python
          "lua_ls",        -- Lua
        },
        automatic_installation = false,
        handlers = {
          -- Disable ALL automatic setups
          function(server_name) 
            -- Do nothing - we handle setup manually
          end,
          -- Explicitly disable specific servers
          ["clangd"] = function() end,
          ["pylsp"] = function() end, 
          ["lua_ls"] = function() end,
        },
      })
    end,
  },

  -- Main LSP configuration
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()

      -- LSP keybindings
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, silent = true }
        
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)           -- Go to definition
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)          -- Go to declaration
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)           -- Find references
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)       -- Find implementations
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- Show documentation
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)    -- Show signature
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- Rename
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)  -- Code actions
        vim.keymap.set("n", "<leader>f", function()
          vim.lsp.buf.format({ async = true })
        end, opts)
        
        -- Diagnostics
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)         -- Previous error
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)         -- Next error
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts) -- Show error
        vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts) -- Error list
      end

      -- Diagnostic configuration with modern approach
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "",
          }
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      -- Disable unwanted LSP servers
      local disabled_servers = { "cssls", "html" }
      for _, server in ipairs(disabled_servers) do
        lspconfig[server].setup = function() end
      end

      -- Server configuration
      
      -- C/C++ (clangd) - Force single instance
      lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        single_file_support = true,
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy", 
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--compile-commands-dir=" .. vim.fn.getcwd(),
          "--log=error", -- Reduce log verbosity
        },
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        },
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern(
            "compile_commands.json",
            ".clangd",
            ".git"
          )(fname) or vim.fn.getcwd()
        end,
      })

      -- Python (pylsp)
      lspconfig.pylsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              pycodestyle = {
                ignore = {'W391'},
                maxLineLength = 100
              }
            }
          }
        }
      })

      -- Lua (lua_ls)
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
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
      })
    end,
  },
}