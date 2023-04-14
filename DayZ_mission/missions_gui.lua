local gui = {
    window,
    button = {},
}

local m_gui =
{
    window,
    scrollpane,
    button = {
        ["take_mission"] = {},
        ["check_mission"] = {},
    },
    image,
    label = {},
}

local s_gui =
{
    window,
    gridlist = {},
    label,
    image,
    column1 = {},
    column2 = {},
}

local act_window = false;
local timer_visible = true;
local lang = "ENG";

local x, y = guiGetScreenSize ()

local button_font = exports.DayZ_font:dgsGetFontFunc("Roboto-Light", 15*(x/1920))
local label_font = exports.DayZ_font:dgsGetFontFunc("Roboto-Light", 13*(x/1920))
local title_font = exports.DayZ_font:dgsGetFontFunc("Roboto-Light", 17*(x/1920))
local gridlist_font = exports.DayZ_font:dgsGetFontFunc("Roboto-Regular", 11*(x/1920))

local table = {"find", "find", "find", "kill_zombie", "kill_player", "find", "kill_zombie", "kill_zombie"}

function guiMissionsVisible(bool)
    DGS:dgsSetVisible(gui.window,  bool)
    if ((not bool) and (timer_visible)) then GuiVisibleTimer(false) end
end

function GuiVisibleChangeTo(value)
    if value == 1 then
        refreshMissionsList()
        DGS:dgsSetVisible(s_gui.window,  false)
        DGS:dgsSetVisible(m_gui.window,  true)
        act_window = 1
    elseif value == 2 then
        refreshStats()
        DGS:dgsSetVisible(m_gui.window,  false)
        DGS:dgsSetVisible(s_gui.window,  true)
        act_window = 2
        if timer_visible then GuiVisibleTimer(false) end
    end
end

function GuiVisibleTimer(value)
    timer_visible = value
    DGS:dgsSetVisible(m_gui.label[1], value)
    DGS:dgsSetVisible(m_gui.label[2], value)
    DGS:dgsSetVisible(m_gui.label[3], value)
    DGS:dgsSetVisible(m_gui.image, value)
    timer_visible = value
    if value then
        DGS:dgsSetText(m_gui.label[1], getTextLang(lang, "new_missions_receive"))
        DGS:dgsSetText(m_gui.label[2], getTextLang(lang, "new_missions_loading"))

        label_timer = setTimer(function()
            local h, m, s = getTimeFormat(npcs_timer, "h+m+s datas")
            local h_string, m_string, s_string = "hour", "minute", "second"
            
            if (h or 0) > 1 then h_string = tostring(h_string).."s" end
            if (m or 0) > 1 then m_string = tostring(m_string).."s" end
            if (s or 0) > 1 then s_string = tostring(s_string).."s" end
            if (h or 0) < 1 then h_string = "hour" end
            if (m or 0) < 1 then m_string = "minute" end
            if (s or 0) < 1 then s_string = "second" end

            DGS:dgsSetText(m_gui.label[3], h.." "..getTextLang(lang, h_string)..", "..m.." "..getTextLang(lang, m_string)..", "..s.." "..getTextLang(lang, s_string))
        end, 1000, 0)
    else
        if label_timer then killTimer(label_timer) DGS:dgsSetText(m_gui.label[3], getTextLang(lang, "loading")) end
    end
end

addEventHandler("onClientResourceStart", resourceRoot,function() 
    gui.window = DGS:dgsCreateImage(0.24, 0.22, 0.53, 0.56, _, true, false, tocolor(47, 53, 57, 225))

    gui.button[1] = DGS:dgsCreateButton(0.00, 0.00, 0.09, 0.425, "", true, gui.window, tocolor(255,255,255,255), false, false, ":DayZ_mission/textures/buttons/button1_1.png", ":DayZ_mission/textures/buttons/button1_2.png", ":DayZ_mission/textures/buttons/button1_3.png", tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(255,255,255,255))
    gui.button[2] = DGS:dgsCreateButton(0.00, 0.425, 0.09, 0.425, "", true, gui.window, tocolor(255,255,255,255), false, false, ":DayZ_mission/textures/buttons/button2_1.png", ":DayZ_mission/textures/buttons/button2_2.png", ":DayZ_mission/textures/buttons/button2_3.png", tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(255,255,255,255)) 
    gui.button[3] = DGS:dgsCreateButton(0.00, 0.85, 0.09, 0.1525, "", true, gui.window, tocolor(255,255,255,255), false, false, ":DayZ_mission/textures/buttons/button3_1.png", ":DayZ_mission/textures/buttons/button3_2.png", ":DayZ_mission/textures/buttons/button3_3.png", tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(255,255,255,255)) 
        

    m_gui.window = DGS:dgsCreateImage(0.09, 0, 0.91, 1, _, true, gui.window, tocolor(47, 53, 57, 225))
    m_gui.scrollpane = DGS:dgsCreateScrollPane(0,0,1,1,true,m_gui.window)

    m_gui.label[1] = DGS:dgsCreateLabel(0, 0.02, 1, 0.09,"ERROR",true,m_gui.window, tocolor(255, 255, 255, 255), 1, 1, _, _ , _, "center", "top")
    m_gui.label[2] = DGS:dgsCreateLabel(0, 0.12, 1, 0.09,"ERROR",true,m_gui.window, tocolor(255, 255, 255, 255), 1, 1, _, _ , _, "center", "top")
    m_gui.label[3] = DGS:dgsCreateLabel(0, 0.16, 1, 0.09,"ERROR",true,m_gui.window, tocolor(255, 255, 255, 255), 1, 1, _, _ , _, "center", "top")
    m_gui.image = DGS:dgsCreateImage(0.25, 0.07, 0.5, 0.01, ":DayZ_mission/textures/others/line.png", true, m_gui.window, tocolor(255, 255, 255, 255))
    DGS:dgsSetFont(m_gui.label[1], title_font)
    DGS:dgsSetFont(m_gui.label[2], button_font)
    DGS:dgsSetFont(m_gui.label[3], button_font)

    s_gui.window = DGS:dgsCreateImage(0.09, 0, 0.91, 1, _, true, gui.window, tocolor(47, 53, 57, 225))
    s_gui.label = DGS:dgsCreateLabel(0, 0.02, 1, 0.09,"ERROR",true,s_gui.window, tocolor(255, 255, 255, 255), 1, 1, _, _ , _, "center", "top")
    s_gui.image = DGS:dgsCreateImage(0.375, 0.07, 0.25, 0.01, ":DayZ_mission/textures/others/line.png", true, s_gui.window, tocolor(255, 255, 255, 255))
    s_gui.gridlist[1] = DGS:dgsCreateGridList(0.13, 0.14, 0.36, 0.72, true, s_gui.window, _, tocolor(58, 63, 67,255), tocolor(255, 255, 255, 255), tocolor(55, 61, 66,255), tocolor(0,0,0,0), tocolor(78, 83, 87,255), tocolor(48, 51, 54,255))
    s_gui.gridlist[2] = DGS:dgsCreateGridList(0.51, 0.14, 0.36, 0.72, true, s_gui.window, _, tocolor(58, 63, 67,255), tocolor(255, 255, 255, 255), tocolor(55, 61, 66,255), tocolor(0,0,0,0), tocolor(78, 83, 87,255), tocolor(48, 51, 54,255))

    s_gui.column1[1] = DGS:dgsGridListAddColumn(s_gui.gridlist[1], "ID", 0.1)
    s_gui.column1[2] = DGS:dgsGridListAddColumn(s_gui.gridlist[1], "Player", 0.6)
    s_gui.column1[3] = DGS:dgsGridListAddColumn(s_gui.gridlist[1], "Complited", 0.2)
    s_gui.column2[1] = DGS:dgsGridListAddColumn(s_gui.gridlist[2], "ID", 0.1)
    s_gui.column2[2] = DGS:dgsGridListAddColumn(s_gui.gridlist[2], "Group", 0.6)
    s_gui.column2[2] = DGS:dgsGridListAddColumn(s_gui.gridlist[2], "Complited", 0.2)

    DGS:dgsSetFont(s_gui.gridlist[1], gridlist_font)
    DGS:dgsSetFont(s_gui.gridlist[2], gridlist_font)

    DGS:dgsSetFont(s_gui.label, title_font)
    guiMissionsVisible(false)
    GuiVisibleTimer(false)

    --triggerServerEvent("onPlayerRefreshStatistics", localPlayer)
end)

function createMissionsGui()
    lang = getElementData(localPlayer, "Jezyk_Gry")
    DGS:dgsSetText(m_gui.label[3], getTextLang(lang, "loading"))
    showCursor(true)
    guiConvVisible(false)
    GuiVisibleChangeTo(1)
    guiMissionsVisible(true)
end

function refreshStats()

    DGS:dgsSetText(s_gui.label, getTextLang(lang, "missions_complited"))

    DGS:dgsGridListSetColumnTitle(s_gui.gridlist[1], 2, getTextLang(lang, "player"))
    DGS:dgsGridListSetColumnTitle(s_gui.gridlist[1], 3, getTextLang(lang, "amount"))

    DGS:dgsGridListSetColumnTitle(s_gui.gridlist[2], 2, getTextLang(lang, "group"))
    DGS:dgsGridListSetColumnTitle(s_gui.gridlist[2], 3, getTextLang(lang, "amount"))

    DGS:dgsGridListClear(s_gui.gridlist[1], true)

    if statistics then
        for k, v in pairs(statistics) do
            local row = DGS:dgsGridListAddRow(s_gui.gridlist[1])
            DGS:dgsGridListSetItemText(s_gui.gridlist[1], row, s_gui.column1[1], k)
            DGS:dgsGridListSetItemText(s_gui.gridlist[1], row, s_gui.column1[2], v[1])
            DGS:dgsGridListSetItemText(s_gui.gridlist[1], row, s_gui.column1[3], v[2])
        end
    end

    DGS:dgsGridListClear(s_gui.gridlist[2], true)

    if statistics_groups then
        for k, v in pairs(statistics_groups) do
            local row = DGS:dgsGridListAddRow(s_gui.gridlist[2])
            DGS:dgsGridListSetItemText(s_gui.gridlist[2], row, s_gui.column1[1], k)
            DGS:dgsGridListSetItemText(s_gui.gridlist[2], row, s_gui.column1[2], v[1])
            DGS:dgsGridListSetItemText(s_gui.gridlist[2], row, s_gui.column1[3], v[2])
        end 
    end
end

function refreshMissionsList()
    if m_gui.scrollpane then
        local npc = getNpcFromActConv()
        if not npc then return end

        for i,v in ipairs(DGS:dgsGetChildren(m_gui.scrollpane)) do
            destroyElement(v)
        end

        
        local id = getNpcId(npc)
        local missions_number = 0;
        local w = 0.9625
        local i = 1


        for k,v in pairs(npcs_missions) do
            if v[1] == id then missions_number = missions_number+1 end
        end

        for k,v in pairs(players_missions) do
            if v[2] == id then missions_number = missions_number+1 end
        end

        if (missions_number == 0) then
            GuiVisibleTimer(true)
            return
        elseif timer_visible then GuiVisibleTimer(false)
        end

        if (missions_number < 7) then w = 0.98 end

        for k,v in pairs(npcs_missions) do
            if v[1] == id then
                local text

                if v[3] == "find" then text = getTextLang(lang, "find").."\n"..getTextLang(lang, "item")..": "..getItemsName(lang, v[4]).."\n"..getTextLang(lang, "amount")..": "..v[5].."\n"..getTextLang(lang, "prize")..": "..v[6].." GP/EXP"
                elseif v[3] == "advanced_find" then text = getTextLang(lang, "advanced_find").."\n"..getTextLang(lang, "location")..": "..advanced_find_location[v[6]].."\n"..getTextLang(lang, "prize")..": "..v[5].." GP/EXP"
                else text = getTextLang(lang, v[3]).."\n"..getTextLang(lang, "amount")..": "..v[4].."\n"..getTextLang(lang, "prize")..": "..v[5].." GP/EXP" end



                createObjectToMissionsList(k, i, w, "take_mission", v[3], text, getTextLang(lang, "take_mission"))
                i = i+1;
            end
        end

        --i = i + 0.25;

        for k,v in ipairs (players_missions) do
            if v[2] == id then

                if v[1] == "find" then text = getTextLang(lang, "find").."\n"..getTextLang(lang, "item")..": "..getItemsName(lang, v[3]).."\n"..getTextLang(lang, "amount")..": "..getElementData(localPlayer, v[3]).."/"..v[4].."\n"..getTextLang(lang, "prize")..": "..v[5].." GP/EXP"
                elseif v[1] == "advanced_find" then local loc = fromJSON(v[3]) text = getTextLang(lang, "advanced_find").."\n"..getTextLang(lang, "location")..": "..advanced_find_location[loc[1]].."\n"..getTextLang(lang, "amount")..": "..(getElementData(localPlayer, "Mission Bag") or 0).."/1\n"..getTextLang(lang, "prize")..": "..v[5].." GP/EXP"
                else text = getTextLang(lang, v[1]).."\n"..getTextLang(lang, "amount")..": "..v[6].."/"..v[4].."\n"..getTextLang(lang, "prize")..": "..v[5].." GP/EXP" end

                createObjectToMissionsList(k, i, w, "check_mission", v[1], text, getTextLang(lang, "check_mission"))
                i=i+1;
            end
        end
        
    end
end

function createObjectToMissionsList(id, number, weight, button_cat, img, text_label, text_button)
    local parent = DGS:dgsCreateImage(0.01,(-0.155)+(0.165*number),weight,0.16, _, true, m_gui.scrollpane, tocolor(67, 73, 77, 225))
    local label = DGS:dgsCreateLabel(0.11, 0.06, 0.61, 0.88,text_label,true,parent)
    m_gui.button[button_cat][id] = DGS:dgsCreateButton(0.73, 0.05, 0.26, 0.90, text_button, true, parent, tocolor(255,255,255,255), false, false, _, _, _, tocolor(78, 83, 87,255), tocolor(64, 69, 72,255), tocolor(48, 51, 54,255))
    DGS:dgsCreateImage(0.01, 0.05, 0.09, 0.90, ":DayZ_mission/textures/cat/"..img..".png", true, parent, tocolor(255, 255, 255, 225))
    DGS:dgsSetFont(m_gui.button[button_cat][id], button_font)
    DGS:dgsSetFont(label, label_font)
end

local AntySpam = true

addEventHandler ( "onDgsMouseClick", root, function(button, state)
    if button ~= "left" then return end
    if state ~= "up" then return end

    if act_window then

        if not AntySpam then 
            exports.DayZ_notification:DrawNotification(getTextLang(lang, "anty_spam"), 212, 125, 125)
            return
        end
    
        AntySpam = false
        setTimer(function() AntySpam = true end, 750, 1)

        local npc = getNpcFromActConv()
        local id = getNpcId(npc)

        for k,v in pairs(npcs_missions) do
            if v[1] == id then
                if source == m_gui.button["take_mission"][k] then

                    local find_m, kill_p, kill_z, adv_find_m = getPlayerMissionValue()

                    if (v[3] == "find") and (find_m >= 3) then exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_limit").." - "..getTextLang(lang, v[3]).."!", 255, 255, 255) return end
                    if (v[3] == "kill_players") and (kill_p >= 1) then exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_limit").." - "..getTextLang(lang, v[3]).."!", 255, 255, 255) return end
                    if (v[3] == "kill_zombies") and (kill_z >= 1) then exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_limit").." - "..getTextLang(lang, v[3]).."!", 255, 255, 255) return end
                    if (v[3] == "advanced_find") and (adv_find_m >= 1) then exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_limit").." - "..getTextLang(lang, v[3]).."!", 255, 255, 255) return end

                    triggerServerEvent("onPlayerTakeMission", localPlayer, k)
                    return
                end
            end
        end

        for k,v in pairs(players_missions) do
            if v[2] == id then
                if source == m_gui.button["check_mission"][k] then
                    triggerServerEvent("onPlayerCheckMission", localPlayer, players_missions[k])
                    return
                end
            end
        end

    end

    if source == gui.button[1] and act_window ~= 1 then
        GuiVisibleChangeTo(1)
    elseif source == gui.button[2] and act_window ~= 2 then
        GuiVisibleChangeTo(2)
    elseif source == gui.button[3] then
        showCursor(false)
        guiMissionsVisible(false)
        act_window = false
    end

end)

--[[if (type == "find") and (find_m >= 3) then exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_limit").." - "..getTextLang(lang, type).."!", 255, 255, 255, source) return end
if (type == "kill_players") and (kill_p >= 1) then exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_limit").." - "..getTextLang(lang, type).."!", 255, 255, 255, source) return end
if (type == "kill_zombies") and (kill_z >= 1) then exports.DayZ_notification:DrawNotification(getTextLang(lang, "mission_limit").." - "..getTextLang(lang, type).."!", 255, 255, 255, source) return end]]