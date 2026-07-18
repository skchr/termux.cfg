require "nvchad.mappings"

-- General mappings ===========================================================

local nmap_leader = function(suffix, rhs, desc)
  vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end

local map = function(mode, key, cb)
  vim.keymap.set(mode, key, cb, { noremap = false, silent = true })
end

-- Function to create a mapping that starts visual mode and moves the cursor
local function v_mv(key)
  return function()
    if vim.o.selection == "inclusive" then
      vim.cmd("normal! v" .. key)
    else
      vim.cmd("normal! V" .. key) -- Use blockwise  visual mode for 'exclusive'
    end
  end
end
map("n", "<C-;>", ":")

require("mini.files").setup {
  mappings = {
    close = "<ESC>",
    go_in = "l",
    go_in_plus = "<CR>",
    go_out = "h",
    go_out_plus = "<BS>",
    mark_goto = "'",
    mark_set = "m",
    reset = "",
    reveal_cwd = "@",
    show_help = "g?",
    synchronize = "=",
    trim_left = "<",
    trim_right = ">",
  },
  windows = {
    -- Maximum number of windows to show side by side
    max_number = math.huge,
    -- Whether to show preview of file/directory under cursor
    preview = true,
    -- Width of focused window
    width_focus = 25,
    -- Width of non-focused window
    width_nofocus = 15,
    -- Width of preview window
    width_preview = 50,
  },
}
map({ "n", "i", "v", "t", "x", "o" }, "<A-e>", function()
  pcall(function()
    if not MiniFiles:close() then
      MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    end
  end)
end)
map({ "i", "n", "v" }, "<A-r>", ":IncRename ")
map({ "i", "n" }, "<A-\\>", function()
  vim.lsp.buf.code_action()
end)

map({ "i", "n" }, "<A-f>", function()
  local grug, ext, name = require "grug-far", vim.bo.buftype == "" and vim.fn.expand "%:e", "grug"
  if grug.has_instance(name) then
    grug.hide_instance(name)
  else
    grug.open {
      transient = true,
      prefills = {
        filesFilter = ext and ext ~= "" and "*." .. ext or nil,
      },
      instanceName = "grug",
      staticTitle = "Find  and Replace",
    }
  end
end)

map({ "n", "i", "v", "t", "x", "o" }, "<S-Left>", v_mv "h")
map({ "n", "i", "v", "t", "x", "o" }, "<S-Up>", v_mv "k")
map({ "n", "i", "v", "t", "x", "o" }, "<S-Down>", v_mv "j")
map({ "n", "i", "v", "t", "x", "o" }, "<S-Right>", v_mv "l")
map({ "n", "i", "v" }, "<C-a>", "<ESC>gg0v$G$")

map({ "n", "i", "v" }, "<ESC>", "<ESC><ESC>")
map({ "i", "n", "v", "x", "o" }, "<C-Tab>", "<cmd>bnext<CR>")
map({ "i", "n", "v", "x", "o" }, "<S-Tab>", "<cmd>bprevious<CR>")
map({ "n", "i" }, "<C-q>", function()
  local is_buf = vim.api.nvim_buf_is_valid(0)

  if is_buf then
    vim.cmd "bd"
  else
    vim.cmd "close"
  end
end)

map({ "n", "i" }, "<A-1>", "<cmd>Nerdy<cr>")

map({ "n", "i" }, "<C-9>", "<cmd>restart<cr>")
map({ "n", "i" }, "<A-2>", "<cmd>InsertEmoji<cr>")
