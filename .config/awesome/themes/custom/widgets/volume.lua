-- ALSA volume

local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")

local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = require("themes.custom.config")

local icon = wibox.widget.imagebox(theme.widget_music)
local volume = lain.widget.alsa {
    settings = function()
        local font_color = theme.fg_normal
        if volume_now.status == "off" then font_color = "red" end
        local volume_level = string.format("%2d", volume_now.level)
        widget:set_markup(
            lain.util.markup.fontfg( theme.font, font_color , " " .. volume_level .. " ")
        )
    end
}
volume.widget:buttons( my_table.join (
    awful.button({}, 1, function()
        awful.spawn("pavucontrol")
    end),
    awful.button({}, 3, function()
        os.execute(
            string.format("%s set %s toggle", volume.cmd, volume.channel)
        )
        volume.update()
    end),
    awful.button({}, 4, function()
        os.execute(
            string.format("%s set %s 1%%+", volume.cmd, volume.channel)
        )
        volume.update()
    end),
    awful.button({}, 5, function()
        os.execute(
            string.format("%s set %s 1%%-", volume.cmd, volume.channel)
        )
        volume.update()
    end)
))

return {
    icon   = icon,
    widget = volume.widget
}
