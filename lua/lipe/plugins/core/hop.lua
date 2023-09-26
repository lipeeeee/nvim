return {
  "phaazon/hop.nvim",
  event = "BufEnter",
  branch = 'v2', -- optional but strongly recommended
  config = function()
    local hop = require('hop')

    local directions = require('hop.hint').HintDirection
    vim.keymap.set('', 'f', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
    end, { remap = true })
    vim.keymap.set('', 'F', function()
      hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
    end, { remap = true })

    hop.setup()
  end
}
