return {
  -- Disable mini.pairs
  { "nvim-mini/mini.pairs", enabled = false },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = {
            "--config",
            '{"MD013": false, "MD022": false, "MD025": false, "MD034": false}',
            "--",
          },
        },
      },
    },
  },
}
