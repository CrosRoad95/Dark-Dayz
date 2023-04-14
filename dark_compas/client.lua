--2017 ~ Mark Gyori https://markgyori.eu/
--Contact: info@markgyori.eu

local sx, sy = guiGetScreenSize()
local top = 20

local font1 = dxCreateFont("font.otf", 11)
local font2 = dxCreateFont("font.otf", 10)

local cords = {
    {0, "N"},
    {15, 15},
    {30, 30},
    {45, "NE"},
    {60, 60},
    {75, 75},
    {90, "E"},
    {105, 105},
    {120, 120},
    {135, "SE"},
    {150, 150},
    {165, 165},
    {170, "S"},
    {195, 195},
    {210, 210},
    {225, "SW"},
    {240, 240},
    {255, 255},
    {270, "W"},
    {285, 285},
    {300, 300},
    {315, "NW"},
    {330, 330},
    {345, 345}
}

addEvent("onClientLogin", true)
addEventHandler("onClientLogin", root, function()
    addEventHandler("onClientRender", root, function()
        local show = 15
        local center = math.ceil(show / 2) - 1
        local _, _, r = getElementRotation(getCamera())
        local pos = math.floor(r / 15)
        local slotwidth = 40
        local smooth = ((r - (pos * 15)) / 15) * slotwidth
        local left = sx / 2 - ((show + 2) * slotwidth)/2
        for i=1, show do
            local id = i + pos - center
            if(id > #cords)then
                id = id - #cords
            end
            if(id <= 0)then
                id = #cords - math.abs(id)
            end
            if(cords[id])then
                local alpha = (tonumber(cords[id][2]) or 0 > 0) and 175 or 255
                if(i < center)then
                    alpha = alpha * (i/center)
                end
                if(i > center)then
                    alpha = alpha * ((show-i)/center)
                end
                dxDrawRectangle(left + slotwidth * i - smooth + (slotwidth / 2 - 1) + 1, top + 10 + 1, 2, 10, tocolor(0, 0, 0, alpha * 0.5))
                dxDrawRectangle(left + slotwidth * i - smooth + (slotwidth / 2 - 1), top + 10, 2, 10, tocolor(255, 255, 255, alpha))
                dxDrawText(cords[id][2], left + slotwidth * i - smooth + 1, top + 20, left + slotwidth * (i+1) - smooth + 2, top + 40, tocolor(0, 0, 0, alpha * 0.5), 1, font2, "center", "center")
                dxDrawText(cords[id][2], left + slotwidth * i - smooth, top + 20, left + slotwidth * (i+1) - smooth, top + 40, tocolor(255, 255, 255, alpha), 1, font2, "center", "center")
            end
        end
        dxDrawText("➤", left + 4, top + 26 + 2, left + ((show + 3) * slotwidth) + 30, 0, tocolor(0, 0, 0, 160), 1, font1, "center", "top", false, false, false, false, false, 90)
        dxDrawText("➤", left, top + 26, left + ((show + 3) * slotwidth) + 30, 0, tocolor(255, 255, 255, 255), 1, font1, "center", "top", false, false, false, false, false, 90)
    end)
end)