-- https://github.com/hakonharnes/img-clip.nvim
return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    default = {
      dir_path = function()
        local git_root = vim.fs.root(0, { ".git" })
        if git_root then
          return git_root .. "/assets"
        end
        return "assets"
      end,
      relative_to_current_file = false,
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
