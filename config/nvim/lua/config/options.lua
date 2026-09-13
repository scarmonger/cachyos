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
--
--
-- vim.g.clipboard = {
--   name = "xclip",
--   copy = {
--     ["+"] = "xclip -selection clipboard",
--     -- ["*"] = "xclip -selection primary",
--   },
--   paste = {
--     ["+"] = "xclip -selection clipboard -o",
--     -- ["*"] = "xclip -selection primary -o",
--   },
--   cache_enabled = 1,
-- }
