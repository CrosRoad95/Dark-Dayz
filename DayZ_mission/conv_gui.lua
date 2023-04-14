DGS = exports.dgs

local additional_ends = {
    ["ENG"] = {
        [1] = "[Missions list]",
        [2] = "[Leave]",
    },
    ["PL"] = {
        [1] = "[List misji]",
        [2] = "[Wyjście]",
    },
}

local gui = {
    window,
    label = {},
    button = {},
}

local x, y = guiGetScreenSize ()

local font_17 = exports.DayZ_font:dgsGetFontFunc("Roboto-Light", 17*(x/1920))
local font_15 = exports.DayZ_font:dgsGetFontFunc("Roboto-Light", 15*(x/1920))

function guiConvVisible(bool)
    DGS:dgsSetVisible(gui.window,  bool)  DGS:dgsSetVisible(gui.button[1],  bool)  DGS:dgsSetVisible(gui.button[2],  bool)
end

addEventHandler("onClientResourceStart", resourceRoot,function()
    local ButtonStyle = {}
    ButtonStyle[1] = DGS:dgsCreateRoundRect(10,false,tocolor(107, 107, 107, 255))
    ButtonStyle[2] = DGS:dgsCreateRoundRect(10,false,tocolor(84, 84, 84, 255))
    ButtonStyle[3] = DGS:dgsCreateRoundRect(10,false,tocolor(64, 64, 64, 255))

    gui.window = DGS:dgsCreateImage(0.28, 0.64, 0.21, 0.14, ":DayZ_mission/conv_background.png", true,_,tocolor(255,255,255,225))
    gui.label[1] = DGS:dgsCreateLabel(0.025, 0.05, 0.1, 0.1, "ERROR", true, gui.window)
    gui.label[2] = DGS:dgsCreateLabel(0, 0, 1, 1, "ERROR", true, gui.window, tocolor(255,255,255,255), _, _, _, _, _, "center", "center")
    gui.button[1] = DGS:dgsCreateButton(0.50, 0.64, 0.21, 0.07, "ERROR", true, false, tocolor(255,255,255,255), false, false, ButtonStyle[1], ButtonStyle[2], ButtonStyle[3])
    gui.button[2] = DGS:dgsCreateButton(0.50, 0.71, 0.21, 0.07, "ERROR", true, false, tocolor(255,255,255,255), false, false, ButtonStyle[1], ButtonStyle[2], ButtonStyle[3])

    guiConvVisible(false)

    DGS:dgsSetFont(gui.label[1], font_15)
    DGS:dgsSetFont(gui.label[2], font_17)
    DGS:dgsSetFont(gui.button[1], font_15)
    DGS:dgsSetFont(gui.button[2], font_15)
end)

function createConversation(name, lang, text, conv1, conv2)
    showCursor(true)
    guiConvVisible(true)

    DGS:dgsSetText(gui.label[1], name)
    DGS:dgsSetText(gui.label[2], text)

    DGS:dgsSetText(gui.button[1], (conv1.." "..additional_ends[lang][1]))
    DGS:dgsSetText(gui.button[2], (conv2.." "..additional_ends[lang][2]))
end

function deleteConversation()
    showCursor(false)
    guiConvVisible(false)
    guiMissionsVisible(false)
end

addEventHandler ( "onDgsMouseClick", root, function(button, state)
    if button ~= "left" then return end
    if state ~= "up" then return end

    if source == gui.button[1] then
        createMissionsGui()
    elseif source == gui.button[2] then
        showCursor(false)
        guiConvVisible(false)
    end
end)