-- return { 
-- "nvimtools/none-ls.nvim",
--
-- config = function()
--     local null_ls = require("null-ls")
--     null_ls.setup({
--       sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.formatting.shfmt,
--          null_ls.builtins.formatting.gofmt,
--     null_ls.builtins.formatting.goimports,
--     null_ls.builtins.diagnostics.golangci_lint,
--       },
--     })
--     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--   end
-- }
-- This config works only when the dev tools are expected to be installed in tbe devcontainer
--

-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--
-- local null_ls = require("null-ls")
--
-- require("devcontainers").on_attach(function()
--   null_ls.setup({
--     sources = {
--       null_ls.builtins.formatting.stylua,
--       null_ls.builtins.formatting.shfmt.with({ command = "/usr/bin/shfmt" }),
--       null_ls.builtins.formatting.gofmt.with({ command = "/go/bin/gofmt" }),
--       null_ls.builtins.formatting.goimports.with({ command = "/go/bin/goimports" }),
--       null_ls.builtins.formatting.gofumpt.with({ command = "/go/bin/gofumpt" }),
--       null_ls.builtins.diagnostics.golangci_lint.with({ command = "/go/bin/golangci-lint" }),
--     },
--   })
--     end)
-- end,
-- }
-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--
--     vim.api.nvim_create_autocmd("User", {
--       pattern = "DevcontainerUp",
--       callback = function()
--         null_ls.setup({
--           sources = {
--             null_ls.builtins.formatting.stylua,
--             null_ls.builtins.formatting.shfmt.with({ command = "/usr/bin/shfmt" }),
--             null_ls.builtins.formatting.gofmt.with({ command = "/go/bin/gofmt" }),
--             null_ls.builtins.formatting.goimports.with({ command = "/go/bin/goimports" }),
--             null_ls.builtins.formatting.gofumpt.with({ command = "/go/bin/gofumpt" }),
--             null_ls.builtins.diagnostics.golangci_lint.with({ command = "/go/bin/golangci-lint" }),
--           },
--         })
--       end,
--     })
--   end,
-- }
-- Does not start devcontaier same as snippet above
-- return {
--   "nvimtools/none-ls.nvim",
--   dependencies = { "jedrzejboczar/devcontainers.nvim" },
--   config = function()
--     local null_ls = require("null-ls")
--
--     -- Ensure devcontainer starts when opening Go-related files
--     local aug = vim.api.nvim_create_augroup("DevcontainersAutoUp", { clear = true })
--     vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
--       group = aug,
--       pattern = { "*.go", "go.mod", "go.sum" },
--       callback = function(args)
--         local util = require("lspconfig.util")
--         local root = util.root_pattern(".devcontainer", "devcontainer.json", ".git")(args.file)
--         if root then
--           vim.cmd("silent! DevcontainersUp")
--         end
--       end,
--     })
--
--     -- Defer null-ls setup until the container is up
--     vim.api.nvim_create_autocmd("User", {
--       pattern = "DevcontainerUp",
--       callback = function()
--         null_ls.setup({
--           sources = {
--             null_ls.builtins.formatting.stylua,
--             null_ls.builtins.formatting.shfmt.with({ command = "/usr/bin/shfmt" }),
--             null_ls.builtins.formatting.gofmt.with({ command = "/go/bin/gofmt" }),
--             null_ls.builtins.formatting.goimports.with({ command = "/go/bin/goimports" }),
--             null_ls.builtins.formatting.gofumpt.with({ command = "/go/bin/gofumpt" }),
--             null_ls.builtins.diagnostics.golangci_lint.with({ command = "/go/bin/golangci-lint" }),
--           },
--         })
--       end,
--     })
--   end,
-- }
--
-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--     local devcontainers = require("devcontainers")
--
--     -- Decide paths depending on whether we're inside devcontainer
--     local function with_container_path(builtin, container_cmd, local_cmd)
--       return builtin.with({
--         command = devcontainers.in_container() and container_cmd or local_cmd,
--       })
--     end
--
--     null_ls.setup({
--       sources = {
--         -- Lua
--         null_ls.builtins.formatting.stylua,
--
--         -- Shell
--         with_container_path(null_ls.builtins.formatting.shfmt, "/usr/bin/shfmt", "shfmt"),
--
--         -- Go formatters
--         with_container_path(null_ls.builtins.formatting.gofmt, "/go/bin/gofmt", "gofmt"),
--         with_container_path(null_ls.builtins.formatting.goimports, "/go/bin/goimports", "goimports"),
--         with_container_path(null_ls.builtins.formatting.gofumpt, "/go/bin/gofumpt", "gofumpt"),
--
--         -- Go diagnostics
--         with_container_path(
--           null_ls.builtins.diagnostics.golangci_lint,
--           "/go/bin/golangci-lint",
--           "golangci-lint"
--         ),
--       },
--     })
--
--     -- Format on <leader>gf
--     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--   end,
-- }

-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--
--     -- Simple check: are we inside a devcontainer?
--     local function in_container()
--       return vim.loop.os_getenv("DEVCONTAINER") ~= nil or vim.loop.fs_stat("/workspaces") ~= nil
--     end
--
--     local function with_container_path(builtin, container_cmd, local_cmd)
--       return builtin.with({
--         command = in_container() and container_cmd or local_cmd,
--       })
--     end
--
--     null_ls.setup({
--       sources = {
--         -- Lua
--         null_ls.builtins.formatting.stylua,
--
--         -- Shell
--         with_container_path(null_ls.builtins.formatting.shfmt, "/usr/bin/shfmt", "shfmt"),
--
--         -- Go formatters
--         with_container_path(null_ls.builtins.formatting.gofmt, "/go/bin/gofmt", "gofmt"),
--         with_container_path(null_ls.builtins.formatting.goimports, "/go/bin/goimports", "goimports"),
--         with_container_path(null_ls.builtins.formatting.gofumpt, "/go/bin/gofumpt", "gofumpt"),
--
--         -- Go diagnostics
--         with_container_path(
--           null_ls.builtins.diagnostics.golangci_lint,
--           "/go/bin/golangci-lint",
--           "golangci-lint"
--         ),
--       },
--     })
--
--     -- Format on <leader>gf
--     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--   end,
-- }
--
-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--
--     -- Detect container based on Go tooling path
--     local function in_container()
--       return vim.fn.executable("/go/bin/golangci-lint") == 1
--     end
--
--     local function with_container_path(builtin, path)
--       return builtin.with({
--         command = in_container() and path or builtin._opts.command,
--       })
--     end
--
--     null_ls.setup({
--       sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.formatting.shfmt,
--         with_container_path(null_ls.builtins.formatting.gofmt, "/go/bin/gofmt"),
--         with_container_path(null_ls.builtins.formatting.goimports, "/go/bin/goimports"),
--         with_container_path(null_ls.builtins.formatting.gofumpt, "/go/bin/gofumpt"),
--         with_container_path(null_ls.builtins.diagnostics.golangci_lint, "/go/bin/golangci-lint"),
--       },
--     })
--
--     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--   end,
-- }
-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--
--     -- Helper: wrap a command so it always runs inside the devcontainer
--     local function in_devcontainer(cmd, extra_args)
--       return {
--         command = "devcontainer",
--         args = vim.list_extend({
--           "exec",
--           "--workspace-folder",
--           vim.fn.getcwd(), -- or your devcontainer workspace path if fixed
--           cmd,
--         }, extra_args or {}),
--       }
--     end
--
--     null_ls.setup({
--       sources = {
--         -- Lua
--         null_ls.builtins.formatting.stylua,
--
--         -- Shell
--         null_ls.builtins.formatting.shfmt.with(in_devcontainer("shfmt")),
--
--         -- Go formatters
--         null_ls.builtins.formatting.gofmt.with(in_devcontainer("gofmt")),
--         null_ls.builtins.formatting.goimports.with(in_devcontainer("goimports")),
--         null_ls.builtins.formatting.gofumpt.with(in_devcontainer("gofumpt")),
--
--         -- Go diagnostics
--         null_ls.builtins.diagnostics.golangci_lint.with(in_devcontainer("golangci-lint")),
--       },
--     })
--
--     -- Keymap for formatting
--     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--   end,
-- }


-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--
--     -- Wrap a command so it runs inside the devcontainer
--     local function in_devcontainer(cmd, extra_args)
--       return {
--         command = "devcontainer",
--         args = vim.list_extend({
--           "exec",
--           "--workspace-folder",
--           vim.fn.getcwd(),
--           cmd,
--         }, extra_args or {}),
--       }
--     end
--
--     null_ls.setup({
--       sources = {
--         -- Lua (host tool, fine)
--         null_ls.builtins.formatting.stylua,
--
--         -- Shell
--         null_ls.builtins.formatting.shfmt.with({
--           command = in_devcontainer("shfmt").command,
--           args = in_devcontainer("shfmt").args,
--         }),
--
--         -- Go formatters
--         null_ls.builtins.formatting.gofmt.with({
--           command = in_devcontainer("gofmt").command,
--           args = in_devcontainer("gofmt").args,
--         }),
--         null_ls.builtins.formatting.goimports.with({
--           command = in_devcontainer("goimports").command,
--           args = in_devcontainer("goimports").args,
--         }),
--         null_ls.builtins.formatting.gofumpt.with({
--           command = in_devcontainer("gofumpt").command,
--           args = in_devcontainer("gofumpt").args,
--         }),
--
--         -- Go diagnostics
--         null_ls.builtins.diagnostics.golangci_lint.with({
--           command = in_devcontainer("golangci-lint").command,
--           args = in_devcontainer("golangci-lint").args,
--         }),
--       },
--     })
--
--     -- Formatting shortcut
--     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--   end,
-- }
--
-- return {
--   "nvimtools/none-ls.nvim",
--   config = function()
--     local null_ls = require("null-ls")
--
--     -- Wrap a command so it runs inside the devcontainer, with debug logging
--     local function in_devcontainer(cmd, extra_args)
--       local args = vim.list_extend({
--         "exec",
--         "--workspace-folder",
--         vim.fn.getcwd(),
--         cmd,
--       }, extra_args or {})
--
--       local config = {
--         command = "devcontainer",
--         args = args,
--       }
--
--       -- Debug: print the full command null-ls will try
--       vim.notify("[null-ls debug] command: " .. config.command .. " " .. table.concat(config.args, " "), vim.log.levels.INFO)
--
--       return config
--     end
--
--     null_ls.setup({
--       sources = {
--         -- Lua (runs locally)
--         null_ls.builtins.formatting.stylua,
--
--         -- Shell
--         null_ls.builtins.formatting.shfmt.with(in_devcontainer("shfmt")),
--
--         -- Go formatters
--         null_ls.builtins.formatting.gofmt.with(in_devcontainer("gofmt")),
--         null_ls.builtins.formatting.goimports.with(in_devcontainer("goimports")),
--         null_ls.builtins.formatting.gofumpt.with(in_devcontainer("gofumpt")),
--
--         -- Go diagnostics
--         null_ls.builtins.diagnostics.golangci_lint.with(in_devcontainer("golangci-lint")),
--       },
--     })
--
--     -- Shortcut for formatting
--     vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
--   end,
-- }
--
--
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "jedrzejboczar/devcontainers.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local function in_devcontainer(cmd, extra_args)
      local args = vim.list_extend({
        "exec",
        "--workspace-folder",
        vim.fn.getcwd(),
        cmd,
      }, extra_args or {})

      return { command = "devcontainer", args = args }
    end

    local function setup_null_ls()
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.shfmt.with(in_devcontainer("shfmt")),
          null_ls.builtins.formatting.gofmt.with(in_devcontainer("gofmt")),
          null_ls.builtins.formatting.goimports.with(in_devcontainer("goimports")),
          null_ls.builtins.formatting.gofumpt.with(in_devcontainer("gofumpt")),
          null_ls.builtins.diagnostics.golangci_lint.with(in_devcontainer("golangci-lint")),
        },
      })
    end

    -- Wait until devcontainer is started
    vim.api.nvim_create_autocmd("User", {
      pattern = "DevcontainersStarted",
      callback = setup_null_ls,
    })
  end,
}

