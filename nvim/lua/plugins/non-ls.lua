return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.go" },
      callback = function()
        vim.lsp.buf.format({ timeout_ms = 1000 })
      end,
    })
  end
}
