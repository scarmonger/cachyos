return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    vim.cmd([[
          function! OpenMarkdownPreview(url)
            execute "silent ! firefox --new-window " . a:url
          endfunction
          let g:mkdp_browserfunc = 'OpenMarkdownPreview'
          let g:mkdp_auto_start = 1
          let g:mkdp_theme = 'light'
        ]])
  end,
}
