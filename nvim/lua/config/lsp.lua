vim.lsp.enable({
  "gopls",
--  "lua_ls",
})

vim.diagnostic.config({
 virtual_lines = true,
  underline = true,
 update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source =  true,
    }
  })

-- vim.lsp.config('lua_ls', { cmd = require('devcontainers').lsp_cmd(vim.lsp.config.lua_ls.cmd) })


-- vim.lsp.config('gopls', { cmd = require('devcontainers').lsp_cmd(vim.lsp.config.gopls.cmd) })

vim.lsp.config('gopls', { cmd = require('devcontainers').lsp_cmd({ 'gopls' }) })




