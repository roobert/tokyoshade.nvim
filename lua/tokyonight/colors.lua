local util = require("tokyonight.util")

local M = {}

---@param config Config
---@return ColorScheme
function M.setup(config)
  config = config or require("tokyonight.config")

  -- Color Palette
  ---@class ColorScheme
  local colors = {}

  colors = {
    none = "NONE",
    white = "#eeeeee",
    bg_dark = "#1f2335",
    bg = "#24283b",
    bg_highlight = "#292e42",
    terminal_black = "#414868",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",

    blue = "#7aa2f7",
    blue0 = "#3d59a1",

    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",
    blue7 = "#394b70",
    magenta = "#bb9af7",
    purple = "#9d7cd8",
    orange = "#ff9e64",
    yellow = "#e0af68",

    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",

    --blue = "#0000ac",
    --blue1 = "#0000bd",
    --blue2 = "#0000cf",
    --indigo = "#0000dd",

    red = "#f7768e",
    red1 = "#db4b4b",
    git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
    gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
  }
  if config.style == "night" or config.style == "day" or vim.o.background == "light" then
    colors.bg = "#1a1b26"
  end
  util.bg = colors.bg
  util.day_brightness = config.dayBrightness

  colors.diff = {
    add = util.darken(colors.green2, 0.15),
    delete = util.darken(colors.red1, 0.15),
    change = util.darken(colors.blue7, 0.15),
    text = colors.blue7,
  }

  colors.gitSigns = {
    add = util.brighten(colors.gitSigns.add, 0.2),
    change = util.brighten(colors.gitSigns.change, 0.2),
    delete = util.brighten(colors.gitSigns.delete, 0.2),
  }

  colors.git.ignore = colors.dark3
  colors.black = util.darken(colors.bg, 0.8, "#000000")
  colors.border_highlight = colors.blue0
  colors.border = colors.black

  -- Popups and statusline always get a dark background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  -- Sidebar and Floats are configurable
  colors.fg_sidebar = colors.fg_dark
  colors.bg_sidebar = config.darkSidebar and colors.bg_dark or colors.bg
  colors.bg_float   = config.darkFloat and colors.bg_dark or colors.bg
  colors.bg_visual  = util.darken(colors.blue0, 0.7)

  colors.search       = colors.orange
  colors.bg_search    = colors.blue0

  colors.todo         = colors.yellow
  colors.error        = colors.red1
  colors.warning      = colors.yellow
  colors.info         = colors.blue2
  colors.hint         = colors.teal

  colors.directory    = colors.blue
  colors.folded       = colors.blue
  colors.substitute   = colors.red
  colors.cursorlinenr = colors.dark5
  colors.moremsg      = colors.blue
  colors.question     = colors.blue

  colors.string            = colors.white
  colors.character         = colors.green
  colors.keyword           = colors.red
  colors.nontext           = colors.dark3
  colors.specialkey        = colors.dark3
  colors.preproc           = colors.blue
  colors.title             = colors.blue
  colors.func              = colors.blue
  colors.type              = colors.blue1
  colors.special           = colors.blue1
  colors.operator          = colors.blue5
  colors.statement         = colors.magenta
  colors.identifier        = colors.magenta
  colors.matchparen        = colors.orange
  colors.constant          = colors.orange

  colors.tsparameter       = colors.yellow
  colors.tsoperator        = colors.tsoperator
  colors.tsconstructor     = colors.magenta
  colors.tsfield           = colors.green1
  colors.tskeyword         = colors.purple
  colors.tskeywordfunction = colors.magenta
  colors.tslabel           = colors.blue
  colors.tsproperty        = colors.green1
  colors.tspunctdelimiter  = colors.blue5
  colors.tspunctbracket    = colors.fg_dark
  colors.tspunctspecial    = colors.blue5
  colors.tsstringregex     = colors.blue6
  colors.tsstringescape    = colors.magenta
  colors.tsvariablebuiltin = colors.red
  colors.tstextreference   = colors.red


  util.color_overrides(colors, config)

  if config.transform_colors and (config.style == "day" or vim.o.background == "light") then
    return util.light_colors(colors)
  end

  return colors
end

return M
