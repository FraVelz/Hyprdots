
-- Configuracion de Numeros.
vim.cmd("set number")
vim.cmd("set relativenumber")

-- Configuracion Basica.
vim.cmd("set mouse=a")
vim.cmd("syntax enable")
vim.cmd("set showcmd")
vim.cmd("set encoding=utf-8")
vim.cmd("set tabstop=4")
vim.cmd("set autoindent")

vim.cmd("set showmatch")
vim.cmd("set expandtab")
vim.cmd("set shiftwidth=0")
vim.cmd("set softtabstop=0")
vim.cmd("set smarttab")

vim.keymap.set('n', '<C-h>', '<C-w>h', {})
vim.keymap.set('n', '<C-l>', '<C-w>l',{})


-- Atajos para modo normal
vim.api.nvim_set_keymap('i', 'zx', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('v', 'zx', '<Esc>', {noremap = true})
vim.api.nvim_set_keymap('c', 'zx', '<C-c>', {noremap = true})
vim.api.nvim_set_keymap('t', 'zx', '<C-\\><C-n>', {noremap = true})

-- Cambiar de buffer con Ctrl+Tab / Ctrl+Shift+Tab
vim.keymap.set('n', '<C-Tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':bprevious<CR>', { silent = true })

-- Ir a pestaña específica con Ctrl+1 ... Ctrl+9
for i = 1, 9 do
  vim.keymap.set('n', '<C-' .. i .. '>', function()
    vim.cmd('BufferLineGoToBuffer ' .. i)
  end, { silent = true })
end

-- Cerrar el buffer actual con Ctrl+W
vim.keymap.set('n', '<C-w>', ':bd<CR>', { silent = true })

