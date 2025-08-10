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
        ensure_installed = {"lua_ls", "bashls"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
       local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
         capabilites = capabilities
      })
      lspconfig.bashls.setup({})
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

