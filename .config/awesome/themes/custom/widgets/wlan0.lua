-- Net
local lain  = require("lain")
local wibox = require("wibox")
local naughty = require("naughty")

local theme = require("themes.custom.config")

local wlan0 = lain.widget.net({
    iface = {"wlp58s0"},
    wifi_state = "on",
    notify = "off",
    settings = function()
        local wlan0 = net_now.devices["wlp58s0"]
        local fontColor = "gray"
        local displayString = " Null "

        if wlan0 and wlan0.wifi then
            fontColor = theme.fg_normal
            if wlan0.carrier == "0" then
                fontColor = "red"
            elseif wlan0.signal < -83 then
                fontColor = "orange"
            elseif wlan0.signal < -70 then
                fontColor = "yellow"
            end

            wlan0.received = string.format("%6.1f", wlan0.received)
            wlan0.sent     = string.format("%6.1f", wlan0.sent    )
            displayString = wlan0.received .. "↓ " .. wlan0.sent .. "↑ "
        end

        widget:set_markup(lain.util.markup.fontfg(theme.font, fontColor, displayString))
    end
})

return {
    icon   = wibox.widget.imagebox(theme.widget_wlan0),
    widget = wlan0.widget
}
