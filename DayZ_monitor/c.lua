local InterfaceTable = {
    {0, "food", 209, 147, 48, "food", 100},
    {0.0375, "thirst", 90, 166, 196, "thirst", 100},
    {0.0750, "blood", 196, 90, 90, "blood", 13000},
    {0.1125, "LVL", 67, 145, 80, "EXP", 100},
}

local screenW, screenH = guiGetScreenSize()
local font = exports.DayZ_font:GetFont("Roboto-Light", 14 * (screenW/1920))
local stat_header_font = exports.DayZ_font:GetFont("Roboto-Light", 19 * (screenW/1920))
local stat_font = exports.DayZ_font:GetFont("Roboto-Light", 12.5 * (screenH/1080))

local TrueFalseTable = {
    [true] = "#32c732ON",
    [false] = "#c73e32OFF",
}

local StatStatus = true



    addEventHandler("onClientRender", root, function()
        if not getElementData(localPlayer, "logedin") then return end

        -- Hud
        for k,v in pairs(InterfaceTable) do
            local data, data2, percent = getElementData(localPlayer, v[2]), getElementData(localPlayer, v[6]), 0

            if (not data) or (not data2) then return end
            
            if v[2] == "LVL" then
                local number1 = (data2 - exports.DayZ_poziomy:GetExpNeedToLevel(data))
                local number2 = exports.DayZ_poziomy:GetExpNeedToLevel(data+1) - exports.DayZ_poziomy:GetExpNeedToLevel(data)
                percent = (number1/number2)
            else 
                percent = (data2/v[7])
            end

            if data < 0 then data, percent = 0, 0 end

            dxDrawRectangle(screenW * 0.8456, screenH * (0.9556-v[1]), screenW * 0.1481, screenH * 0.0333, tocolor(0, 0, 0, 50), false)
            dxDrawRectangle(screenW * 0.8650, screenH * (0.9600-v[1]), screenW * 0.1263, screenH * 0.0244, tocolor(0, 0, 0, 40), false)
            dxDrawRectangle(screenW * 0.8650, screenH * (0.9600-v[1]), screenW * (0.1263*percent), screenH * 0.0244, tocolor(v[3], v[4], v[5], 255), false)
            dxDrawImage(screenW * 0.8488, screenH * (0.9600-v[1]), screenW * 0.0138, screenH * 0.0244, "textures/"..v[2]..".png", 0, 0, 0, tocolor(255, 255, 255, 155), false)
            dxDrawText(math.floor(data), screenW * 0.8650, screenH * (0.9600-(v[1]*2)), screenW * 0.9912, screenH * 0.9844, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
        end

        local bleeding = getElementData(localPlayer, "bleeding") or 0
        local brokenbone = getElementData(localPlayer, "brokenbone") or false
        local temperature = getElementData(localPlayer, "temperature") or 37

        if temperature < 36.5 then dxDrawImage(screenW * 0.9719, screenH * 0.7967, screenW * 0.0219, screenH * 0.0389, "textures/cold.png", 0, 0, 0, tocolor(255, 255, 255, 105), false) end
        if temperature > 37.5 then dxDrawImage(screenW * 0.9475, screenH * 0.7967, screenW * 0.0219, screenH * 0.0389, "textures/hot.png", 0, 0, 0, tocolor(255, 255, 255, 105), false) end
        if brokenbone then dxDrawImage(screenW * 0.9231, screenH * 0.7967, screenW * 0.0219, screenH * 0.0389, "textures/broken-bone.png", 0, 0, 0, tocolor(255, 255, 255, 105), false) end
        if bleeding > 0 then dxDrawImage(screenW * 0.8988, screenH * 0.7967, screenW * 0.0219, screenH * 0.0389, "textures/bleeding.png", 0, 0, 0, tocolor(255, 255, 255, 105), false) end

        -- Stats F5
        if StatStatus then
            local lang = getElementData(localPlayer, "Jezyk_Gry")

            local KDR = "KDR: "..string.format('%.2f', (getElementData(localPlayer, 'KDR') or 0) )
            local zombies_killed = GetTextLand(lang, "zombies_killed")..": "..(getElementData(localPlayer, "zombieskilled") or 0).." | "..(getElementData(localPlayer, "TotalZombieKilled") or 0)
            local murders = GetTextLand(lang, "murders")..": "..(getElementData(localPlayer, "murders") or 0).." | "..(getElementData(localPlayer, "TotalMurders") or 0)
            local deaths = GetTextLand(lang, "deaths")..": "..(getElementData(localPlayer, "TotalDeaths") or 0)
            local headshots = GetTextLand(lang, "headshots")..": "..(getElementData(localPlayer, "headshots") or 0).." | "..(getElementData(localPlayer, "TotalHeadshot") or 0)
            local GP = "GP: "..(getElementData(localPlayer, "GP") or 0)
            local PP = "PP: "..(getElementData(localPlayer, "PP") or 0)


            dxDrawRectangle(screenW * 0.8456, screenH * 0.3044, screenW * 0.1481, screenH * 0.1989, tocolor(0, 0, 0, 80), false)
            --dxDrawRectangle(screenW * 0.8519, screenH * 0.3533, screenW * 0.1356, screenH * 0.1389, tocolor(0, 0, 0, 60), false)
            dxDrawImage(screenW * 0.8534, screenH * 0.3100, screenW * 0.0187, screenH * 0.0333, "textures/stat.png", 0, 0, 0, tocolor(255, 255, 255, 175), false)
            dxDrawText(GetTextLand(lang, "title"), screenW * 0.8778, screenH * 0.3100, screenW * 0.9900, screenH * 0.3433, tocolor(255, 255, 255, 175), 1.00, stat_header_font, "left", "center", false, false, false, false, false)
            dxDrawText(KDR.."\n"..zombies_killed.."\n"..murders.."\n"..deaths.."\n"..headshots.."\n"..GP.."\n"..PP, screenW * 0.8531, screenH * 0.3578, screenW * 0.9850, screenH * 0.4867, tocolor(255, 255, 255, 175), 1.00, stat_font, "left", "center", false, false, false, false, false)
        end

        -- Weapon Hud
		if getElementData(localPlayer, "mawidziec") then
            if getElementData(localPlayer, 'duty') then
                local tag_status = false
                if getElementData(localPlayer, "showAdmin") then tag_status = true end
			    dxDrawText("#FFFFFFDuty: "..TrueFalseTable[true].."#ffffff  Fly: "..TrueFalseTable[getElementData(localPlayer, "Ryjek")], screenW * 0.8650, screenH * 1.5200, screenW * 0.9912, screenH * 0.1233, tocolor(255, 0, 0, 255), 1.0, font, "center", "center", false, false, false, true, false)
			    dxDrawRectangle(screenW * 0.8456, screenH * (0.9556-0.15), screenW * 0.1481, screenH * 0.0333, tocolor(0, 0, 0, 50), false)
				dxDrawText("#FFFFFFTag: "..TrueFalseTable[tag_status].."#ffffff  God: "..TrueFalseTable[getElementData(localPlayer, "god")], screenW * 0.8650, screenH * 1.4500, screenW * 0.9912, screenH * 0.1233, tocolor(255, 0, 0, 255), 1.0, font, "center", "center", false, false, false, true, false)
				dxDrawRectangle(screenW * 0.8456, screenH * (0.9556-0.1875), screenW * 0.1481, screenH * 0.0333, tocolor(0, 0, 0, 50), false)
			end
        end
    end)
bindKey( "f5", "up", function() StatStatus = not StatStatus end)