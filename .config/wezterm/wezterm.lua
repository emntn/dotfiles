local wezterm = require 'wezterm'
local config = {}

config.warn_about_missing_glyphs = false

config.font = wezterm.font { family = 'JetBrains Mono' }
config.font_size = 10.5

config.font_rules = {
  {
    intensity = 'Bold',
    italic = false,
    font = wezterm.font {
      family = 'JetBrains Mono',
      weight = 'ExtraBold',
    },
  },
  {
    intensity = 'Bold',
    italic = true,
    font = wezterm.font {
      family = 'JetBrains Mono',
      weight = 'ExtraBold',
      style = 'Italic',
    },
  },
}


config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

config.window_close_confirmation = 'NeverPrompt'
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}


config.color_scheme = "gruvbox_material_dark_hard"
config.color_schemes = {
  ["gruvbox_material_dark_hard"] = {
    foreground = "#D4BE98",
    background = "#101010",
    cursor_bg = "#a89984",
    cursor_border = "#D4BE98",
    cursor_fg = "#101010",
    selection_bg = "#D4BE98",
    selection_fg = "#3C3836",

    ansi = { "#101010", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
    brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
  },
}

config.keys = {
  {
    key = 'C',
    mods = 'CTRL',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'V',
    mods = 'CTRL',
    action = wezterm.action.PasteFrom 'Clipboard',
  },
}


return config
