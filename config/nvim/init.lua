-- ~/.config/nvim/init.lua

-- Instalar y Configurar Controlador de Plugins Lazy...
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("vim-options")

-- Auto Completado...

local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({

    snippet = {
        expand = function(args)
        luasnip.lsp_expand(args.body)
        end,
    },

    completion = {
        -- número máximo de items que aparecen en el menú
        max_item_count = 10
    },

    -- otras configuraciones que ya tengas
    mapping = cmp.mapping.preset.insert({
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter
    }),

    sources = {
        { name = "luasnip" },
        { name = 'nvim_lsp', max_item_count = 5 },
        { name = 'buffer', max_item_count = 3 },
        { name = 'path', max_item_count = 2 },
    }
})

-- Auto Completado Propios...
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

-- Recargar config
vim.api.nvim_set_keymap('n', '<leader>rc', ':luafile $MYVIMRC<CR>', { noremap = true, silent = true })

-- Refrescar lualine
vim.api.nvim_set_keymap('n', '<leader>rl', ':lua require("lualine").refresh()<CR>', { noremap = true, silent = true })

-- Refrescar nvim-tree
vim.api.nvim_set_keymap('n', '<leader>rn', ':lua require("nvim-tree.view").refresh()<CR>', { noremap = true, silent = true })
