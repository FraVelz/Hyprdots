return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local Terminal = require("toggleterm.terminal").Terminal

    -- Terminal flotante persistente
    local runner = Terminal:new({ direction = "horizontal", hidden = true })

    local function run_file()
      if runner:is_open() then
        -- Si ya está abierta, ciérrala
        runner:toggle()
        return
      end

      local ft = vim.bo.filetype
      local file = vim.fn.expand("%:p")

      local cmd
      if ft == "cpp" then
        cmd = string.format("g++ -std=c++17 '%s' -o /tmp/a.out && /tmp/a.out", file)
      elseif ft == "c" then
        cmd = string.format("gcc '%s' -o /tmp/a.out && /tmp/a.out", file)
      elseif ft == "python" then
        cmd = "python3 '" .. file .. "'"
      elseif ft == "javascript" then
        cmd = "node '" .. file .. "'"
      elseif ft == "lua" then
        cmd = "lua '" .. file .. "'"
      end

      runner:toggle()
      if cmd then
        runner:send(cmd .. "\n")
      else
        vim.notify("Tipo de archivo no soportado", vim.log.levels.WARN)
      end
    end

    require("toggleterm").setup({
      size = 8,
      direction = "horizontal",
      shade_terminals = true,
    })

    -- Ctrl+Alt+N para ejecutar o cerrar
    vim.keymap.set("n", "<C-A-n>", run_file, { desc = "Ejecutar/cerrar terminal" })
  end,
}

