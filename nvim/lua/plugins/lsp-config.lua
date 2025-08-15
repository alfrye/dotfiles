return {
  {
    "williamboman/mason.nvim",
    config = function()
       require("mason").setup()
    end
  },
  {
     "williamboman/mason-lspconfig.nvim",
     config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls", "bashls", "gopls"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig_util = require('lspconfig.util')
lspconfig_util.on_setup = lspconfig_util.add_hook_after(lspconfig_util.on_setup, function(config, user_config)
    config.on_new_config = lspconfig_util.add_hook_after(config.on_new_config, require('devcontainers').on_new_config)
end)
       local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
         capabilites = capabilities
      })
      lspconfig.bashls.setup({})
      lspconfig.gopls.setup {
        -- Optional: Add custom settings for gopls
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                staticcheck = true,
            },
        },
    }
       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca',  vim.lsp.buf.code_action,{})
          vim.diagnostic.config({
        virtual_text = {
            -- Set to true to enable virtual text for diagnostics
            -- Set to false to disable it
            enabled = true,
            -- Optional: Customize the prefix character for virtual text
            prefix = '●', -- Example: '■', '▎', 'x'
            -- Optional: Show the source of the diagnostic (e.g., language server name)
            -- "always" or "if_many"
            source = "always",
        },
        -- Optional: Sort diagnostics by severity for signs and virtual text
        severity_sort = true,
        -- Optional: Configure floating window behavior for diagnostics
        float = {
            source = "always",
        },
    })
    end
  }
}

