-- -- lua/config/init.lua
vim.notify("✅ Devcontainer.nvim Configuration files loaded!", vim.log.levels.INFO, {
  title = "LazyVim"
})

-- return
--  {
--      'jedrzejboczar/devcontainers.nvim',
--      config = function() 
--       require('devcontainers').setup({
--      log = { level = 'trace' },
--     --  root_dir_resolver = function(start_dir)
--     --    return require('devcontainers.finders').git_devcontiner(start_dir) or 
--     --        require('devcontainers.finders').go_mod(start_dir)
--     --    end,
--     })
--  end,
--     dependencies = {
--          'miversen33/netman.nvim', -- optional to browse files in docker container
--           "neovim/nvim-lspconfig",    
--      },
--     opts = {},
-- }

--- This code block works except it pass in the wrong values for the workspace folder
-- return {
--   "jedrzejboczar/devcontainers.nvim",
--   dependencies = {
--     "neovim/nvim-lspconfig",
--     -- optional extras:
--     -- "stevearc/overseer.nvim", -- nicer task UI for `devcontainer up`
--     -- "miversen33/netman.nvim", -- browse container files via docker://
--   },
--   opts = {
--       workspace_folder = "/workspaces/SSE",
--       autoStart = true,
-- --        workspace_folder = "/workspaces/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
--   }, -- defaults: auto-start when .devcontainer/ (or devcontainer.json) is in root
--   init = function()
--     -- (Optional) Eagerly start the devcontainer when opening Go files,
--     -- instead of waiting for LSP to request it.
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
--   end,
-- }

--
-- return {
--   "jedrzejboczar/devcontainers.nvim",
--   dependencies = { "neovim/nvim-lspconfig" },
--   opts = {
--     -- tell the plugin the actual workspace dir inside the container
--     workspace_folder = "/workspaces/${localWorkspaceFolderBasename}",
--   },
--   init = function()
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
--   end,
--
-- }
--
-- return {
--   "jedrzejboczar/devcontainers.nvim",
--   dependencies = {
--     "neovim/nvim-lspconfig",
--   },
--   opts = {
--     -- Override how workspaceFolder is passed to "devcontainer exec"
--     workspace_folder = function(local_ws)
--       -- Example: /home/alanfrye/code/SSE → /workspaces/SSE
--       local basename = vim.fn.fnamemodify(local_ws, ":t")
--       local mapped = "/workspaces/" .. basename
--       vim.notify("devcontainers.nvim workspace_folder "   .. mapped)
--       return mapped
--      -- return "/workspaces/" .. basename
--     end,
--   },
--   init = function()
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
--   end,
-- }
--
-- return {
--   "jedrzejboczar/devcontainers.nvim",
--   dependencies = {
-- "netman.nvim",
--     "neovim/nvim-lspconfig",
--   },
--   opts = {
--     workspace_folder = function(local_ws)
--       local basename = vim.fn.fnamemodify(local_ws, ":t")
--       local mapped = "/workspaces/" .. basename
--       vim.notify("devcontainers.nvim workspace_folder → " .. mapped)
--       return mapped
--     end,
--   },
--   config = function(_, opts)
--     require("devcontainers").setup(opts)  -- this makes sure opts is applied
--
--     -- Auto-start devcontainer when opening Go files
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
--   end,
-- }
--
--
--
-- devcontainers.nvim using the nvim lsp new api
-- return {
--   "jedrzejboczar/devcontainers.nvim",
--   opts = {
--     workspace_folder = function(local_ws)
--       local basename = vim.fn.fnamemodify(local_ws, ":t")
--       return "/workspaces/" .. basename
--     end,
--   },
--   config = function(_, opts)
--     require("devcontainers").setup(opts)
--
--     -- Auto start devcontainer for Go projects
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
--   end,
-- }
--
--
return {
  "jedrzejboczar/devcontainers.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  opts = {
    -- optional, in case you want to override workspace_folder mapping
    -- workspace_folder = function(local_ws)
    --   return "/workspaces/" .. vim.fn.fnamemodify(local_ws, ":t")
    -- end,
  },
  config = function(_, opts)
    require("devcontainers").setup(opts)

    -- Optional: autostart a container when opening Go projects
    local aug = vim.api.nvim_create_augroup("DevcontainersAutoUp", { clear = true })
    vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
      group = aug,
      pattern = { "*.go", "go.mod", "go.sum" },
      callback = function(args)
        local util = require("lspconfig.util")
        local root = util.root_pattern(".devcontainer", "devcontainer.json", ".git")(args.file)
        if root then vim.cmd("silent! DevcontainersUp") end
      end,
    })
  end,
}
