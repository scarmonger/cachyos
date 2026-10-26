-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- vim.cmd([[
--   function! OpenMarkdownPreview(url)
--     execute "silent !chromium --new-window " . shellescape(a:url) . " &"
--     redraw!
--   endfunction
-- ]])
--
-- vim.g.mkdp_browserfunc = "OpenMarkdownPreview"
-- vim.g.mkdp_theme = "light"
-- vim.g.mkdp_auto_start = 1
