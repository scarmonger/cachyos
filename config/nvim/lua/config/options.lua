-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.winbar = "%=%m %f"
vim.opt.clipboard = "unnamedplus"
vim.opt.smartcase = true
vim.opt.conceallevel = 0

vim.opt.iskeyword:append("-") -- hyphenated words recognized by searches / "asdf-asdf" is treated as one word
-- vim.highlight = "CursorLineNr ctermfg=220 ctermbg=25 gui=bold guifg=#ffd700 guibg=#005faf"
-- vim.highlight = "LineNr ctermfg=DarkGrey guifg=DarkGrey"

-- Keep breakindent enabled so wrapped lines align with the line's start indent
vim.opt.breakindent = true

-- Optional: Add extra visual indentation spaces (e.g., 2 spaces) to wrapped lines
vim.opt.breakindentopt = "shift:2,min:20"

-- Optional: Add a subtle indicator character at the start of wrapped lines
vim.opt.showbreak = "↳ "

-- markdown-preview setup
vim.cmd([[
  function! OpenMarkdownPreview(url)
    execute "silent !chromium --new-window " . shellescape(a:url) . " &"
    redraw!
  endfunction
]])

vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
vim.g.mkdp_theme = "light"
