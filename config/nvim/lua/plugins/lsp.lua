return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      marksman = {
        handlers = {
          ["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
            if result and result.diagnostics then
              local filtered = {}
              for _, diagnostic in ipairs(result.diagnostics) do
                -- Filter out "Link to non-existent document"
                if not diagnostic.message:find("Link to non%-existent document") then
                  table.insert(filtered, diagnostic)
                end
              end
              result.diagnostics = filtered
            end
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, config)
          end,
        },
      },
    },
  },
}
