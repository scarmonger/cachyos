-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- remap button
vim.keymap.set("n", ";", ":", {})
vim.keymap.set("n", ":", ";", {})

-- command abbreviation
vim.keymap.set("ca", "note", "cd ~/Dropbox/notes/")
vim.keymap.set("ca", "cach", "cd ~/marc/github/cachyos/")
vim.keymap.set("ca", "obt", "Obsidian tags")

-- Memetakan Alt+1 sampai Alt+3 untuk memasukkan tanda '#' bertingkat di Insert Mode
-- Anda bisa menambahkannya sesuai kebutuhan (misal sampai Alt+6 untuk ######)

vim.keymap.set("i", "<M-1>", "# ", { desc = "Heading 1" })
vim.keymap.set("i", "<M-2>", "## ", { desc = "Heading 2" })
vim.keymap.set("i", "<M-3>", "### ", { desc = "Heading 3" })
vim.keymap.set("i", "<M-4>", "#### ", { desc = "Heading 4" })
vim.keymap.set("i", "<M-5>", "##### ", { desc = "Heading 5" })
vim.keymap.set("i", "<M-6>", "###### ", { desc = "Heading 6" })

vim.keymap.set("n", "<M-1>", "I# <esc>", { desc = "Heading 1" })
vim.keymap.set("n", "<M-2>", "I## <esc>", { desc = "Heading 2" })
vim.keymap.set("n", "<M-3>", "I### <esc>", { desc = "Heading 3" })
vim.keymap.set("n", "<M-4>", "I#### <esc>", { desc = "Heading 4" })
vim.keymap.set("n", "<M-5>", "I##### <esc>", { desc = "Heading 5" })
vim.keymap.set("n", "<M-6>", "I###### <esc>", { desc = "Heading 6" })

-- vim.keymap.set("n", "<C-BS>", "<esc>:bdelete<CR>", { desc = "Delete buffer", silent = true })
vim.keymap.set({ "n", "i" }, "<C-\\>", "<esc>:bdelete<cr>", { desc = "" })

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
vim.keymap.set("n", "<leader>r", '"rp', { desc = "paste from r register" })

vim.keymap.set("n", "<leader>ta", "ggVG", { desc = "select all" })
-- vim.keymap.set("n", "<leader>tv", ":let @r = @+<cr>", { desc = "copy to clipboard" })
--
vim.keymap.set(
  "n",
  "<leader>tr",
  ":let @+ = expand('%:p')<cr>o<c-r>+<Esc>dF/xv0d:let @+ = @*<cr>i<backspace><esc>:!go run <c-r>+<enter>",
  { desc = "go run" }
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

local function link_file_under_cursor()
  local line = vim.api.nvim_get_current_line()

  -- Extract filename enclosed in [[...]] or [...]
  local original_filename = line:match("%[%[(.-)%]%]") or line:match("%[(.-)%]")
  if not original_filename or original_filename == "" then
    vim.notify("No pattern [[file]] or [file] found on current line.", vim.log.levels.WARN)
    return
  end

  local target_dir = "/home/mc/Dropbox/notes/"

  -- Search recursively in /home/mc/Dropbox/ using fd or fallback to find
  local search_cmd = string.format(
    "fd --type f --fixed-strings --hidden --exclude .git %s %s 2>/dev/null",
    vim.fn.shellescape(original_filename),
    vim.fn.shellescape(target_dir)
  )

  local handle = io.popen(search_cmd)
  local result = handle:read("*a")
  handle:close()

  if result == "" then
    search_cmd = string.format(
      "find %s -type f -name %s 2>/dev/null",
      vim.fn.shellescape(target_dir),
      vim.fn.shellescape(original_filename)
    )
    handle = io.popen(search_cmd)
    result = handle:read("*a")
    handle:close()
  end

  local full_path = result:match("([^\r\n]+)")
  if not full_path or full_path == "" then
    vim.notify("File not found: " .. original_filename, vim.log.levels.ERROR)
    return
  end

  -- Separate directory and filename
  local dir = full_path:match("(.*/)") or ""
  local current_file = full_path:match("[^/]+$")

  -- Replace spaces with underscores in the target file name
  local new_file = current_file:gsub(" ", "_")
  local final_full_path = dir .. new_file

  -- Rename the file on disk if it contained spaces
  if current_file ~= new_file then
    local success, err = os.rename(full_path, final_full_path)
    if not success then
      vim.notify("Failed to rename file: " .. (err or "unknown error"), vim.log.levels.ERROR)
      return
    end
    vim.notify(string.format("Renamed on disk: '%s' -> '%s'", current_file, new_file), vim.log.levels.INFO)
  end

  -- URL-encode any remaining spaces in directory paths (%20)
  local encoded_path = final_full_path:gsub(" ", "%%20")

  -- Check file extension (case-insensitive)
  local ext = new_file:match("%.([^%.]+)$")
  ext = ext and ext:lower() or ""

  local formatted_line
  if ext == "png" or ext == "jpg" or ext == "jpeg" then
    formatted_line = string.format("![%s](%s)", new_file, encoded_path)
  else
    formatted_line = string.format("[%s](%s)", new_file, encoded_path)
  end

  -- Replace line under cursor
  vim.api.nvim_set_current_line(formatted_line)
end

-- Keymapping for <leader>tc in Normal mode
vim.keymap.set("n", "<leader>tc", link_file_under_cursor, {
  desc = "Find, rename spaces on disk, and link file from Dropbox",
  silent = true,
})
