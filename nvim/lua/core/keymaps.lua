-- lua/core/keymaps.lua

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Convenience options
local opts = { noremap = true, silent = true }

-- Quick save / quit
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Floating terminal runner
local function devcontainer_exec(cmd)
  -- open floating terminal with devcontainer exec
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen("devcontainer exec --workspace-folder " .. vim.fn.getcwd() .. " " .. cmd)
end

-- Go build inside devcontainer
vim.keymap.set("n", "<leader>gb", function()
  devcontainer_exec("go build ./...")
end, { desc = "Go build (devcontainer)" })

-- Run tests inside devcontainer
-- vim.keymap.set("n", "<leader>gt", function()
--   devcontainer_exec("go test ./...")
-- end, { desc = "Go test (devcontainer)" })
--
