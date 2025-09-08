-- Function: Run `go build` inside devcontainer in a floating terminal
local function go_build_devcontainer()
  -- Determine project root
  local clients = vim.lsp.get_active_clients({ name = "gopls" })
  local root = (#clients > 0 and clients[1].config.root_dir) or vim.loop.cwd()

  -- Translate host → container path
  local container_root = root:gsub("^/home/alanfrye/code", "/workspaces")

  -- Full command
  local cmd = {
    "devcontainer",
    "exec",
    "--workspace-folder",
    container_root,
    "go",
    "build",
    "./...",
  }

  -- Open floating terminal
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen(cmd, {
    cwd = root,
    on_exit = function(_, code)
      if code == 0 then
        vim.notify("✅ go build succeeded", vim.log.levels.INFO)
      else
        vim.notify("❌ go build failed", vim.log.levels.ERROR)
      end
    end,
  })

  -- Enter insert mode in terminal automatically
  vim.cmd("startinsert")
end

-- Keymap: <leader>gb
-- vim.keymap.set("n", "<leader>gb", go_build_devcontainer, { desc = "Go build in devcontainer" })
