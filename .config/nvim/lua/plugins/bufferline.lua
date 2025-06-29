return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  opts = {
    options = {
      show_buffer_close_icons = false,
      separator_style = { "", "" },
      diagnostics = "nvim_lsp",
      color_icons = true,
      indicator = {
        style = "none",
      },
      always_show_bufferline = false,
      mode = "buffers",
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
