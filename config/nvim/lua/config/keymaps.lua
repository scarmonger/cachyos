-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- remap button
vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", ":", ";", {})

-- vim.keymap.set({ "i", "x", "n", "s" }, "'", '"', {})
-- vim.keymap.set({ "i", "x", "n", "s" }, '"', "'", {})
vim.keymap.set("i", "jk", "<esc>", { desc = "escape from insert mode" })
vim.keymap.set("i", "kj", "<esc>", { desc = "escape from insert mode" })
vim.keymap.set("n", "gj", ":BufferLineMovePrev<cr>", { desc = "move location to prev buffer" })
vim.keymap.set("n", "gk", ":BufferLineMoveNext<cr>", { desc = "move location to next buffer" })
vim.keymap.set("n", "gh", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("v", "<leader><Enter>", ":.! bc -l <CR>", { desc = "calculate number" })

vim.keymap.set("n", "<F5>", ":UndotreeToggle<CR>", { desc = "UndotreeToggle" })

vim.keymap.set("n", "H", "^", { desc = "" })
vim.keymap.set("v", "H", "^", { desc = "" })
vim.keymap.set("n", "L", "$", { desc = "" })
vim.keymap.set("v", "L", "$h", { desc = "" })
vim.keymap.set({ "n", "i" }, "<M-l>", "<esc>:bnext<cr>", { desc = "" })
vim.keymap.set({ "n", "i" }, "<M-h>", "<esc>:bprevious<cr>", { desc = "" })

vim.keymap.set("n", "<M-r>", ":w | GoRun<cr>", { desc = "GoRun" })
vim.keymap.set("i", "<M-r>", "<esc>:w | GoRun<cr>", { desc = "GoRun" })

vim.keymap.set(
  "n",
  "<C-y>",
  ":! tmux new-window -n fx '~/.config/helix/yazi-picker-tmux.sh e'<cr>",
  { desc = "open Yazi" }
)
-- vim.keymap.set("n", "<C-d>", '<esc>"_dd', { desc = "delete line when insert mode" })
vim.keymap.set("i", "<C-d>", '<esc>"_ddi', { desc = "delete line when insert mode" })

-- REGISTERS
-- vim.keymap.set({ "n", "v" }, "<c-n>", '"nyy', { desc = "copy to buffer n" })
-- vim.keymap.set({ "n", "v" }, "<c-s-n>", '"nyy', { desc = "copy to buffer n" })
vim.keymap.set("n", "<m-n>", '"nP', { desc = "paste from n buffer" })
vim.keymap.set("i", "<m-n>", "<c-r>n", { desc = "paste from n buffer" })
vim.keymap.set("n", "<leader>yp", ":let @+ = expand('%:p')<cr>", { desc = "copy filepath" })
vim.keymap.set("n", "<leader>yd", ":let @+ = expand('%:p:h:h %:p')<cr>", { desc = "copy file's directory" })
-- vim.keymap.set("n", "<leader>yc", ":let @+= @*<cr>", { desc = "transfer / copy * registers to clipboard" })
-- vim.keymap.set("n", "<leader>yr", ":let @+ = @r<CR>", { desc = "Copy @r to system clipboard" })
vim.keymap.set({ "n", "v" }, '"0', '"0p', { desc = "paste from last yank" })
vim.keymap.set("i", "<C-v>", '<C-r>"', { desc = "paste from the last yank, delete" })
vim.keymap.set("i", "<C-b>", "<C-r>0", { desc = "paste from last yank" })
vim.keymap.set("v", "<leader>y", '"ry', { desc = "copy into r register" })
vim.keymap.set("n", "<leader>yy", '"ryy', { desc = "copy into r register" })
vim.keymap.set("n", "<leader>p", '"rp', { desc = "paste from r register" })

vim.keymap.set("n", "<leader>ta", "ggVG", { desc = "select all" })
vim.keymap.set("n", "<leader>th", ':! thorium-browser "<c-r>%"<CR>', { desc = "preview markdown" })
vim.keymap.set("n", "<leader>tf", ':! firefox "<c-r>%"<CR>', { desc = "preview markdown" })
vim.keymap.set("n", "<leader>tp", ":let @r = @+<cr>", { desc = "copy to clipboard" })
-- vim.keymap.set("n", "<leader>tk", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
vim.keymap.set(
  "n",
  "<leader>tr",
  ":let @+ = expand('%:p')<cr>o<c-r>+<Esc>dF/xv0d:let @+ = @*<cr>i<backspace><esc>:!go run <c-r>+<enter>",
  { desc = "go run" }
)
vim.keymap.set(
  "n",
  "<leader>tc",
  ":let @+ = expand('%:p')<cr>o<c-r>+<Esc>dF/xv0d:let @+ = @*<cr>i<backspace><esc>:cd <c-r>+<enter>",
  { desc = "change cwd to current file location" }
)

-- snippets
vim.keymap.set("n", "\\htm", ":read $HOME/.config/nvim/snippets/skeleton.html<CR>3jwf>a")
vim.keymap.set("n", "\\sig", ":read $HOME/.config/nvim/snippets/signature<CR>")
vim.keymap.set("n", "\\rfc", ":read $HOME/.config/nvim/snippets/rafce<CR>")
vim.keymap.set("n", "\\gpf", ':read $HOME/.config/nvim/snippets/go-printf<CR>ci"')
vim.keymap.set("n", "\\gpl", ':read $HOME/.config/nvim/snippets/go-println<CR>ci"')
vim.keymap.set("n", "\\gmf", ":read $HOME/.config/nvim/snippets/go-mainFunc<CR>3ji<tab>")

vim.keymap.set("n", "x", '"_x', { desc = "prevent yank character when deleting" })
vim.keymap.set("n", "X", '"_x', { desc = "prevent yank character when deleting" })
vim.keymap.set("n", "<Del>", '"_x', { desc = "prevent yank character when deleting" })
vim.keymap.set("v", "x", '"_x', { desc = "prevent yank character when deleting" })
vim.keymap.set("v", "X", '"_x', { desc = "prevent yank character when deleting" })
vim.keymap.set("v", "<Del>", '"_x', { desc = "prevent yank character when deleting" })

-- Primeagen
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "paste in visual mode, don't yank" })

vim.keymap.set("n", "<leader>d", '"_d', { desc = "delete into void" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "delete into void" })
vim.keymap.set("x", "<leader>d", '"_d', { desc = "delete into void" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "change project" })
-- go back to previous session with <tmux-leader>+L

vim.keymap.set("i", "<C-v>", "<esc>pa", { desc = "paste in insert mode" })
vim.keymap.set(
  "n",
  "<leader>se",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "replace word using sed" }
)
vim.keymap.set("n", "<leader>xe", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make this file executable" })

-- This file is automatically loaded by lazyvim.plugins.config
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<leader>sf", "<cmd>so %<cr>", { desc = "source file" })
-- map("n", "<leader>s0", "<cmd>Telescope notify<cr>", { desc = "check notification" })

-- Delete line when in insert mode
map("i", "<C-d>", "<esc>ddi", {})

-- Copy file name path to clipboard
map("n", "<F8>", ":let @+ = expand('%:p')<CR>", {})
map("n", "<F11>", " a<C-R>=strftime('%c')<CR>", {})

--Read an empty HTML template and move cursor to title
map("i", ",html", ":read $HOME/.config/nvim/snipfile/.skeleton.html<CR>3jwf>a", {})

-- Add undo break-points
map("i", " ", " <c-g>u")
-- map("i", ",", ",<c-g>u")
-- map("i", ".", ".<c-g>u")
-- map("i", ";", ";<c-g>u")

-- Redirect 'c' and 'C' to the black hole register
vim.keymap.set("n", "c", '"_c', { noremap = true })
vim.keymap.set("n", "C", '"_C', { noremap = true })
vim.keymap.set("v", "c", '"_c', { noremap = true })

-- Redirect 'x' and 'X' to the black hole register
vim.keymap.set("n", "x", '"_x', { noremap = true })
vim.keymap.set("n", "X", '"_X', { noremap = true })
vim.keymap.set("v", "x", '"_x', { noremap = true })
