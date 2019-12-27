-- cpu

local lain  = require("lain")
local wibox = require("wibox")

local theme = require("themes.custom.config")

local fs = lain.widget.fs({
    notification_preset = {
        fg = theme.fg_normal,
        bg = theme.bg_normal,
        font = "consolas 12"
    },
    settings = function()
        local fsp = string.format(
            " %6.2f %s ", fs_now["/home"].free, fs_now["/home"].units
        )
        widget:set_markup(
            lain.util.markup.font(theme.font, fsp)
        )
    end
})

return {
    icon   = wibox.widget.imagebox(theme.widget_hdd),
    widget = fs.widget
}
