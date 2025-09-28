return {
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]() -- instala dependencias internas
    end,
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_browser = "firefox"  -- o tu navegador
      vim.g.mkdp_theme = "dark"      -- "light" o "dark"
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" }
    }
  }
}

