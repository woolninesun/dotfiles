-- Net
local lain  = require("lain")
local wibox = require("wibox")
local naughty = require("naughty")

local theme = require("themes.custom.config")

local eth0 = lain.widget.net({
    iface = {"enxf428531baf28"},
    eth_state = "on",
    notify = "off",
    settings = function()
        local eth0 = net_now.devices["enxf428531baf28"]
        local fontColor = "gray"
        local displayString = " Null "

        if eth0 and eth0.ethernet then
            fontColor = theme.fg_normal
            if eth0.carrier == "0" then
                fontColor = "red"
            end

            eth0.received = string.format("%6.1f", eth0.received)
            eth0.sent     = string.format("%6.1f", eth0.sent    )
            displayString = eth0.received .. "↓ " .. eth0.sent .. "↑ "
        end

        widget:set_markup(lain.util.markup.fontfg(theme.font, fontColor, displayString))
    end
})

return {
    icon   = wibox.widget.imagebox(theme.widget_eth0),
    widget = eth0.widget
}
