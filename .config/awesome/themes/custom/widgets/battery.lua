-- battery

local lain  = require("lain")
local wibox = require("wibox")

local theme = require("themes.custom.config")

local icon   = wibox.widget.imagebox(theme.widget_battery)
local battery = lain.widget.bat({
    notify = "off",
    settings = function()
        if bat_now.status ~= "N/A" then
            if bat_now.perc and tonumber(bat_now.perc) <= 10 then
                icon:set_image(theme.widget_battery_empty)
                font_color = "red"
            elseif bat_now.perc and tonumber(bat_now.perc) <= 20 then
                icon:set_image(theme.widget_battery_low)
                font_color = "red"
            else
                icon:set_image(theme.widget_battery)
                font_color = theme.fg_normal
            end
            bat_now.perc = string.format("%3d", bat_now.perc)
            widget:set_markup(
                lain.util.markup.fontfg(
                    theme.font, font_color, " " .. bat_now.perc .. "% "
                )
            )
        else
            widget:set_markup()
            icon:set_image(theme.widget_ac)
        end
    end
})

return {
    icon   = icon,
    widget = battery.widget
}
