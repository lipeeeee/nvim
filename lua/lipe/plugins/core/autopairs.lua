return {
  "windwp/nvim-autopairs",
  event="InsertEnter",
  opts={
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    disable_in_macro = true,  -- disable when recording or executing a macro
    disable_in_visualblock = false, -- disable when insert after visual block mode
    disable_in_replace_mode = true,
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    enable_moveright = true,
    enable_afterquote = true,  -- add bracket pairs after quote
    enable_check_bracket_line = true,  --- check bracket in same lin
    enable_bracket_in_quote = true,
    enable_abbr = false, -- trigger abbreviation
    break_undo = true, -- switch for basic rule break undo sequence
    check_ts = true,
    map_cr = true,
    map_bs = true,
    map_c_h = false,
    map_c_w = false,
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0, -- Offset from pattern match
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }
}
