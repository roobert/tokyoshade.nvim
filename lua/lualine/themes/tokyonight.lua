local config = require("tokyonight.config")
local colors = require("tokyonight.colors").setup(config)
local util = require("tokyonight.util")

local tokyonight = {}

tokyonight.normal = {
  a = { bg = colors.black, fg = colors.blue },
  b = { bg = colors.black, fg = colors.fg_sidebar },
  c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

tokyonight.insert = {
  a = { bg = colors.black, fg = colors.red },
  b = { bg = colors.black, fg = colors.fg_sidebar },
}

tokyonight.command = {
  a = { bg = colors.black, fg = colors.yellow },
  b = { bg = colors.black, fg = colors.fg_sidebar },
}

tokyonight.visual = {
  a = { bg = colors.black, fg = colors.magenta },
  b = { bg = colors.black, fg = colors.fg_sidebar },
}

tokyonight.replace = {
  a = { bg = colors.black, fg = colors.green },
  b = { bg = colors.black, fg = colors.fg_sidebar },
}

tokyonight.inactive = {
  a = { bg = colors.bg_statusline, fg = colors.blue },
  b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
  c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

if vim.o.background == "light" then
  for _, mode in pairs(tokyonight) do
    for _, section in pairs(mode) do
      if section.bg then
        section.bg = util.getColor(section.bg)
      end
      if section.fg then
        section.fg = util.getColor(section.fg)
      end
    end
  end
end

return tokyonight
