-- https://github.com/hakonharnes/img-clip.nvim
return {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    default = {
      -- file and directory options
      dir_path = "/home/mc/Dropbox/notes/assets",
      extension = "png",
      file_name = "%Y-%m-%d-%H-%M-%S",
      use_absolute_path = true,
      relative_to_current_file = false,
    },
  },
  keys = {
    -- suggested keymap
    { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
  },
}
