-- ~/.config/nvim/lua/plugins/lsp.lua
--
-- return {
--   {
--     "neovim/nvim-lspconfig",
--     -- This ensures the plugin loads when you open a Go file.
--     event = "VeryLazy",
--
--     -- dependencies = {
--     --   -- This plugin automatically installs and manages LSP servers.
--     --   "williamboman/mason.nvim",
--     --   "williamboman/mason-lspconfig.nvim",
--     -- },
--
--     config = function()
--       -- Your native diagnostic configuration can go here.
--       vim.diagnostic.config({
--         virtual_lines = true,
--         underline = true,
--         update_in_insert = false,
--         severity_sort = true,
--         float = {
--           border = "rounded",
--           source = true,
--         },
--       })
--
--       -- This is the correct way to use nvim-lspconfig to set up gopls.
--       local lspconfig = require("lspconfig")
--
--       lspconfig.gopls.setup({
--         vim.lsp.config('gopls', { cmd = require('devcontainers').lsp_cmd(vim.lsp.config.gopls.cmd) }),
--        -- cmd = require("devcontainers").lsp_cmd({ "gopls" }),
--         -- You can put other gopls-specific settings here.
--         settings = {
--           gopls = {
--             analyses = {
--               unusedparams = true,
--             },
--             staticcheck = true,
--           },
--         },
--       })
--
--       -- Add other LSPs here using the same pattern.
--       -- lspconfig.lua_ls.setup({})
--     end,
--   },
-- }
-- -- ~/.config/nvim/lua/plugins/lsp.lua

-- return {
--   {
--     "neovim/nvim-lspconfig",
--     -- This ensures the plugin loads when you open a Go file.
--     event = { "BufReadPost *.go" },
--
--     dependencies = {
--       -- This plugin automatically installs and manages LSP servers.
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--     },
--
--     config = function()
--       -- Your native diagnostic configuration can go here.
--       vim.diagnostic.config({
--         virtual_lines = true,
--         underline = true,
--         update_in_insert = false,
--         severity_sort = true,
--         float = {
--           border = "rounded",
--           source = true,
--         },
--       })
--
--       -- This is the correct way to use nvim-lspconfig to set up gopls.
--       local lspconfig = require("lspconfig")
--       local devcontainers = require("devcontainers")
--
--       lspconfig.gopls.setup({
--         -- The crucial line: this uses the devcontainers helper to set the cmd.
--         cmd = devcontainers.lsp_cmd({ "gopls" }),
--         -- You can put other gopls-specific settings here.
--         settings = {
--           gopls = {
--             analyses = {
--               unusedparams = true,
--             },
--             staticcheck = true,
--           },
--         },
--       })
--     end,
--   },
-- }
--

-- ~/.config/nvim/lua/plugins/lsp.lua

-- return {
--   -- This specifies the plugin that provides the configuration helpers.
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       -- This plugin is essential for managing server installations
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--     },
--
--     -- The `config` function will be run automatically by LazyVim
--     -- after the plugin and its dependencies are loaded.
--     config = function()
--       -- Set up your diagnostic behavior. This is a native Neovim call.
--       vim.diagnostic.config({
--         virtual_lines = true,
--         underline = true,
--         update_in_insert = false,
--         severity_sort = true,
--         float = {
--           border = "rounded",
--           source = true,
--         },
--       })
--
--       -- Load the devcontainers plugin module
--       local devcontainers = require("devcontainers")
--
--       -- Load the lspconfig plugin module
--       local lspconfig = require("lspconfig")
--
--       -- This is the crucial part:
--       -- We use lspconfig.gopls.setup to configure the Go language server.
--       -- We pass the `cmd` key with the result of `devcontainers.lsp_cmd`
--       -- which tells Neovim to start the server inside the devcontainer.
--       lspconfig.gopls.setup({
--         cmd = devcontainers.lsp_cmd({ "gopls" }),
--         -- You can add any other gopls-specific settings here.
--         settings = {
--           gopls = {
--             analyses = {
--               unusedparams = true,
--             },
--           },
--         },
--       })
--
--       -- If you want to enable lua_ls, you would configure it similarly.
--       -- lspconfig.lua_ls.setup({
--       --   cmd = devcontainers.lsp_cmd({ "lua-language-server" }),
--       -- })
--     end,
--   },
-- }

-- ~/.config/nvim/lua/plugins/lsp.lua

-- return {
--   {
--     -- This declares the devcontainers.nvim plugin. LazyVim will manage its installation.
--     "jedrzejboczar/devcontainers.nvim",
--     -- This tells LazyVim to load this plugin on startup.
--     -- This is crucial because it must be loaded before you can use its helpers.
--     lazy = false,
--   },
--
--   -- This is a simple plugin specification for your LSP configuration.
--   {
--     "lsp_go_config", -- a unique name for this plugin spec
--     event = { "BufReadPost *.go" }, -- This loads the config when you open a Go file
--
--     config = function()
--       local devcontainers = require("devcontainers")
--
--       -- Check if we are inside a devcontainer. This prevents the LSP from starting
--       -- incorrectly if you open a Go file outside of a devcontainer.
--       if devcontainers.is_active() then
--         -- This is the native Neovim LSP API call.
--         -- It takes a table and a language server name.
--         vim.lsp.start({
--           name = 'gopls',
--           cmd = devcontainers.lsp_cmd({ "gopls" }),
--         })
--       end
--
--       -- Your native diagnostic configuration can still go here.
--       vim.diagnostic.config({
--         virtual_lines = true,
--         underline = true,
--         update_in_insert = false,
--         severity_sort = true,
--         float = {
--           border = "rounded",
--           source = true,
--         },
--       })
--     end,
--   },
-- }

-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     local lspconfig = require("lspconfig")
--
--     -- Basic on_attach + capabilities
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     local on_attach = function(client, bufnr)
--       local opts = { buffer = bufnr, noremap = true, silent = true }
--       vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     end
--
--     -- Configure Go LSP
--     lspconfig.gopls.setup({
--       on_attach = on_attach,
--       capabilities = capabilities,
--     })
--   end,
-- }


-- return {
--   "neovim/nvim-lspconfig",
--   dependencies = { "jedrzejboczar/devcontainers.nvim" },
--   config = function()
--     local lspconfig = require("lspconfig")
--     local devcontainers = require("devcontainers")
--
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     local on_attach = function(client, bufnr)
--       local opts = { buffer = bufnr, noremap = true, silent = true }
--       vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     end
--
--     -- gopls configured to run inside the devcontainer
--     lspconfig.gopls.setup({
--       cmd = devcontainers.command("gopls"), -- ⬅️ important
--       on_attach = on_attach,
--       capabilities = capabilities,
--     })
--   end,
-- }
--


-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     local lspconfig = require("lspconfig")
--     local devcontainers = require("devcontainers")
--
--     -- on_attach + capabilities (same as before)
--     local capabilities = vim.lsp.protocol.make_client_capabilities()
--     local on_attach = function(client, bufnr)
--       local opts = { buffer = bufnr, noremap = true, silent = true }
--       vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--       vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--     end
--
--     -- Use devcontainers wrapper to run LSP inside the container
--     lspconfig.gopls.setup(devcontainers.lsp_config({
--       on_attach = on_attach,
--       capabilities = capabilities,
--       -- You could also override cmd if needed, but devcontainers handles it
--     }))
--   end,
-- }


-- return {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     local lspconfig = require("lspconfig")
--     local util = require("lspconfig.util")
--
--     -- Hook devcontainers.nvim into *all* lspconfig servers (legacy API that lspconfig still exposes)
--     util.on_setup = util.add_hook_after(util.on_setup, function(config, _)
--       config.on_new_config = util.add_hook_after(
--         config.on_new_config,
--         require("devcontainers").on_new_config -- <- the correct function
--       )
--     end)
--
--     -- Minimal gopls setup; leave `cmd` unset so it defaults to {"gopls"}.
--     -- devcontainers.nvim will wrap it and run gopls *inside* the container.
--     lspconfig.gopls.setup({
--       root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--     })
--   end,
-- }
-- return {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   config = function()
--     local lspconfig = require("lspconfig")
--     local util = require("lspconfig.util")
--     local devcontainers = require("devcontainers")
--
--     -- Wrap on_new_config so LSP runs inside container
--     util.on_setup = util.add_hook_after(util.on_setup, function(config, _)
--       config.on_new_config = util.add_hook_after(
--         config.on_new_config,
--         devcontainers.on_new_config
--       )
--     end)
--
--     -- Add path translation so gopls sees /workspaces/* instead of host paths
--     lspconfig.gopls.setup({
--       root_dir = util.root_pattern("go.work", "go.mod", ".git"),
-- --      cmd = { "devcontainer", "exec", "--workspace-folder", "/workspaces/SSE", "gopls" },
--       on_attach = devcontainers.lsp_on_attach,
--       -- on_attach = function(client, bufnr)
--       --   -- translate paths for this LSP client
--       -- --  devcontainers.lsp_translate_path(client, bufnr)
--       -- end,
--     })
--   end,
-- }
--
-- gopls.lua (or inside your lsp.lua)
-- return {
--   "neovim/nvim-lspconfig", -- still needed for util/root_pattern
--   config = function()
--     local devcontainers = require("devcontainers")
--     local util = require("lspconfig.util")
--
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "go",
--       callback = function(args)
--         local root = util.root_pattern("go.work", "go.mod", ".git")(args.file)
--         if not root then return end
--
--         vim.lsp.start({
--           name = "gopls",
--           cmd = { "devcontainer", "exec", "--workspace-folder", "/workspaces/SSE", "gopls" },
--           root_dir = root,
--           on_attach = devcontainers.lsp_on_attach,
--         })
--       end,
--     })
--   end,
-- }
--
-- gopls.lua
-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     local devcontainers = require("devcontainers")
--     local util = require("lspconfig.util")
--
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "go",
--       callback = function(args)
--         local local_root = util.root_pattern("go.work", "go.mod", ".git")(args.file)
--         if not local_root then return end
--
--         -- Ask devcontainers.nvim to map local → container workspace
--         local container_root = devcontainers.workspace_folder(local_root)
--
--         vim.lsp.start({
--           name = "gopls",
--           cmd = { "devcontainer", "exec", "--workspace-folder", container_root, "gopls" },
--           root_dir = local_root,
--           on_attach = devcontainers.lsp_on_attach,
--         })
--       end,
--     })
--   end,
-- }
-- lsp.lua
-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     local util = require("lspconfig.util")
--
--     -- helper: map local → container path
--     local function to_container_path(local_ws)
--       local basename = vim.fn.fnamemodify(local_ws, ":t")
--       return "/workspaces/" .. basename
--     end
--
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "go",
--       callback = function(args)
--         local local_root = util.root_pattern("go.work", "go.mod", ".git")(args.file)
--         if not local_root then return end
--
--         local container_root = to_container_path(local_root)
--
--         vim.lsp.start({
--           name = "gopls",
--           cmd = { "devcontainer", "exec", "--workspace-folder", local_root, "gopls" },
--           root_dir = local_root,
--         })
--       end,
--     })
--   end,
-- }
--

-- -- ******* This config seems to work properly when new lsp api alnog with my current devcontainer.lua setup
-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     -- Tell Neovim to use devcontainer-wrapped commands for gopls
--     vim.lsp.config('gopls', {
--       cmd = require('devcontainers').lsp_cmd({ 'gopls' }),
--       root_dir = require('lspconfig.util').root_pattern("go.work", "go.mod", ".git"),
--       on_attach = require('devcontainers').lsp_on_attach,
--     })
--
--     -- Enable automatic start for gopls
--     vim.lsp.enable('gopls')
--   end,
-- }
--
-- ** Added in fall back logic for projects that don't use devcontainers and need to use lsp locally
return {
  "neovim/nvim-lspconfig",
  config = function()
    local devcontainers = require("devcontainers")
    local util = require("lspconfig.util")

    -- Decide whether to run gopls inside container or locally
    local function gopls_cmd()
      -- Look up from current buffer’s directory
      local cwd = vim.fn.getcwd()
      local root = util.root_pattern(".devcontainer", "devcontainer.json", ".git")(cwd)

      if root and vim.fn.filereadable(root .. "/.devcontainer/devcontainer.json") == 1 then
        -- Inside devcontainer project
        return devcontainers.lsp_cmd({ "gopls" })
      else
        -- No devcontainer → fallback to system gopls
        return { "gopls" }
      end
    end

    -- Register config
    vim.lsp.config("gopls", {
      cmd = gopls_cmd(),
      root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      on_attach = devcontainers.lsp_on_attach,
    })

    -- Enable auto-start
    vim.lsp.enable("gopls")
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

  end,
}

