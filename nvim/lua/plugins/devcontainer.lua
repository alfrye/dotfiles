return
{
  "erichlf/devcontainer-cli.nvim",
  dependencies = { "akinsho/toggleterm.nvim" },
  init = function()
    require("devcontainer-cli").setup({
      -- only the most useful options shown; see full config below
      interactive = false,
      toplevel = true,
      remove_existing_container = true,
      dotfiles_repository = "https://github.com/alfrye/dotfiles",
      dotfiles_branch = "feature/devcontainer-cli.nvim",
      dotfiles_targetPath = "~/dotfiles",
      dotfiles_installCommand = "install.sh",
      shell = "bash",
      nvim_binary = "nvim",
      log_level = "debug",
      console_level = "info",
    })
  end,
}
