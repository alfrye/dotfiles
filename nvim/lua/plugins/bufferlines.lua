return {

{
    'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',

config = function()

  vim.opt.termguicolors = true
    require("bufferline").setup{}
vim.keymap.set('n', '<leader>bn', '<CMD>:bn<CR>', {desc = "Buffer Next"})
vim.keymap.set('n', '<leader>bp', '<CMD>:bp<CR>', {desc = "Buffer Previous"})
vim.keymap.set('n', '<leader>bd', '<CMD>:bd<CR>', {desc = "Buffer Delete"})
  end,



  },
}
