local wezterm = require 'wezterm';

return {
  -- Font configuration
  font = wezterm.font_with_fallback({ 
    "JetBrains Mono",
    "Symbols Nerd Font Mono",
  }),

  -- Font size
  font_size = 12.0,  -- Adjust the font size as needed

  -- Disable the tab bar
  enable_tab_bar = false,

  -- Color scheme
  colors = {
    foreground = "#C0CAF5",
    background = "#1A1B26",
    cursor_bg = "#C0CAF5",
    cursor_fg = "#45475a", -- This is the cursor text color from Kitty config
    cursor_border = "#C0CAF5",

    ansi = {
      "#414868", -- color0
      "#F7768E", -- color1
      "#9ECE6A", -- color2
      "#E0AF68", -- color3
      "#7AA2F7", -- color4
      "#BB9AF7", -- color5
      "#7DCFFF", -- color6
      "#A9B1D6", -- color7
    },
    brights = {
      "#414868", -- color8
      "#F7768E", -- color9
      "#9ECE6A", -- color10
      "#E0AF68", -- color11
      "#7AA2F7", -- color12
      "#BB9AF7", -- color13
      "#7DCFFF", -- color14
      "#C0CAF5", -- color15
    },
  },
}
