-- ~/.config/nvim/lua/plugins/autopairs.lua
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",  -- se carga al entrar en modo Insert
    config = function()
    require("nvim-autopairs").setup({})
    end,
}

