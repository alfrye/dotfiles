return
{
  "arnaupv/nvim-devcontainer-cli",
  opts = {
    -- By default, if no extra config is added, following nvim_dotfiles are
    -- installed: "https://github.com/LazyVim/starter"
    -- This is an example for configuring other nvim_dotfiles inside the docker container
    devcontainer_folder=".devcontainer/",
    nvim_dotfiles_repo = "https://github.com/alfrye/dotfiles",
    nvim_dotfiles_branch="feature/devcontainer-cli.nvim",
    nvim_dotfiles_directory="~/nvim_dotfiles",
    nvim_dotfiles_install_command = "cd ~/nvim_dotfiles/ && ./install.sh",
    -- In case you want to change the way the devenvironment is setup, you can also provide your own setup
     -- setup_environment_repo = "",
     -- setup_environment_install_command = "",
  },
  keys = {
    -- stylua: ignore
    {
      "<leader>cdu",
      ":DevcontainerUp<cr>",
      desc = "Up the DevContainer",
    },
    {
      "<leader>cdc",
      ":DevcontainerConnect<cr>",
      desc = "Connect to DevContainer",
    },
  }
}
--return {
--   {
  --   -- Terminal management
  --   "akinsho/toggleterm.nvim",
  --   version = "*",
  --   cmd = { "ToggleTerm", "TermExec" },
  --   config = function()
  --     local ok, toggleterm = pcall(require, "toggleterm")
  --     if not ok then
  --       vim.notify("toggleterm.nvim not found", vim.log.levels.WARN)
  --       return
  --     end
  --
  --     toggleterm.setup({
  --       size = 50,
  --       open_mapping = [[<c-\>]], -- Ctrl+\ toggles the terminal
  --       hide_numbers = true,
  --       shade_terminals = true,
  --       shading_factor = 2,
  --       start_in_insert = true,
  --       insert_mappings = true,
  --       persist_size = true,
  --       direction = "float", -- "float" | "horizontal" | "vertical"
  --       close_on_exit = true,
  --       shell = vim.o.shell,
  --       float_opts = {
  --         border = "rounded",
  --         width = math.floor(vim.o.columns * 0.9),
  --         height = math.floor(vim.o.lines * 0.8),
  --         winblend = 5,
  --       },
  --     })
  --   end,
  -- },
-- {
--   "erichlf/devcontainer-cli.nvim",
--   dependencies = { "akinsho/toggleterm.nvim" },
--   init = function()
--     require("devcontainer-cli").setup({
--       -- only the most useful options shown; see full config below
--       interactive = false,
--       toplevel = true,
--       remove_existing_container = true,
--       dotfiles_repository = "https://github.com/alfrye/dotfiles",
--       dotfiles_branch = "feature/devcontainer-cli.nvim",
--       dotfiles_targetPath = "~/dotfiles",
--       dotfiles_installCommand = "install.sh",
--       shell = "bash",
--       nvim_binary = "nvim",
--       log_level = "debug",
--       console_level = "info",
--         terminal = {
--           direction = "float"
--         },
--     })
--   end,
-- }
--}
