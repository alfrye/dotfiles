return {
  "erichlf/devcontainer-cli.nvim",
  dependencies = { 'akinsho/toggleterm.nvim' },
  config = function ()
    require('devcontainer-cli').setup({

       workspace_mount = true,
      nvim_config_mount = true,
      auto_start = true,
      dotfiles_repository = "",
      dotfiles_installCommand = "",
    })
  end,
}
