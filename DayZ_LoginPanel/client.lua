DGS = exports.dgs

local GeneralPanel = {
    window = {},
    button = {},
    image = {},
    edit = {},
    label = {},
    checkbox = {},
    edit_background = {},
    panel = {},
}

local language = "ENG"

local XML = {};
local act_panel = "register"
local time_animation = 500
local music
local AntySpam = true

local login_panel_status = false

local font = exports.DayZ_font:dgsGetFontFunc("Roboto-Light", 10)
local font2 = exports.DayZ_font:dgsGetFontFunc("Roboto-Bold", 15)
local font3 = exports.DayZ_font:dgsGetFontFunc("Roboto-Light", 12)

local x, y = guiGetScreenSize();

local file = xmlLoadFile("datas.xml")

XML["bool"] = false

if file then
    local values_bool = xmlNodeGetAttribute(file, "values_bool")
    if values_bool == "true" then
        XML["login"] = xmlNodeGetAttribute(file,"login")
        XML["password"] = xmlNodeGetAttribute(file,"password")
        XML["bool"] = true
    end
else
	file = xmlCreateFile("datas.xml","datas")
	xmlNodeSetAttribute(file,"values_bool","false")
	xmlNodeSetAttribute(file,"login","")
	xmlNodeSetAttribute(file,"password","")
	xmlSaveFile(file)
end

addEvent("onPlayerDayZLogin", true )


function CreateGUI()
	-- General thinks
    GeneralPanel.window[1] = DGS:dgsCreateImage(0, 0, 1, 1, "images/background.jpg", true, false)
    GeneralPanel.window[2] = DGS:dgsCreateImage(0, 0, 1, 1, false, true, GeneralPanel.window[1], tocolor(68, 73, 77, 195))

    GeneralPanel.image[6] = DGS:dgsCreateImage((x - 650) / 2, (y - 325) / 2, 650, 325, ":DayZ_LoadingScreen/images/logo.png", false, GeneralPanel.window[1]) 

-- Login Panel
    GeneralPanel.panel["login"] = DGS:dgsCreateImage(0, 0, 1, 1, false, true, GeneralPanel.window[1], tocolor(68, 73, 77, 0))

    GeneralPanel.button[1] = DGS:dgsCreateButton(0.41, 0.55, 0.17, 0.05, GetTextLand(language, "login_in"), true, GeneralPanel.panel["login"], tocolor(255,255,255,255), false, false, ":DayZ_LoginPanel/images/button1.png", ":DayZ_LoginPanel/images/button2.png", ":DayZ_LoginPanel/images/button3.png", tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(255,255,255,255))
    GeneralPanel.button[2] = DGS:dgsCreateButton(0.41, 0.61, 0.17, 0.05, GetTextLand(language, "create_new_acc"), true, GeneralPanel.panel["login"], tocolor(255,255,255,255), false, false, ":DayZ_LoginPanel/images/button1.png", ":DayZ_LoginPanel/images/button2.png", ":DayZ_LoginPanel/images/button3.png", tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(255,255,255,255))

    GeneralPanel.label[1] = DGS:dgsCreateLabel(0.41, 0.31, 0.17, 0.05, GetTextLand(language, "welcome")..", #c4c4c4"..getPlayerName(localPlayer).."#ffffff.", true, GeneralPanel.panel["login"], tocolor(255,255,255,255), false, false, false, false, false, "center", "bottom")
    DGS:dgsSetProperty(GeneralPanel.label[1],"colorcoded",true)

    GeneralPanel.label[2] = DGS:dgsCreateLabel(0.425, 0.52, 0.16, 0.02, GetTextLand(language, "remember_password"), true, GeneralPanel.panel["login"])

    GeneralPanel.checkbox[1] = DGS:dgsCreateCheckBox(0.41, 0.52, 0.01, 0.02, "", XML["bool"], true, GeneralPanel.panel["login"], tocolor(255,255,255,255), false, false, ":DayZ_LoginPanel/images/checkboxoff.png", ":DayZ_LoginPanel/images/checkboxoff.png", ":DayZ_LoginPanel/images/checkboxoff.png", tocolor(255,255,255,255), false, false, ":DayZ_LoginPanel/images/checkboxon.png", ":DayZ_LoginPanel/images/checkboxon.png", ":DayZ_LoginPanel/images/checkboxon.png")

    local text_login = "Login     "
    if XML["bool"] then text_login = XML["login"] end
    GeneralPanel.edit_background[1] = DGS:dgsCreateImage(0.41, 0.39, 0.17, 0.05, false, true, GeneralPanel.panel["login"], tocolor(204, 204, 204, 0))
    GeneralPanel.image[1] = DGS:dgsCreateImage(0, 0, 0.17, 1, "images/acc.png", true, GeneralPanel.edit_background[1])
    GeneralPanel.edit[1] = DGS:dgsCreateEdit(0.17, 0, 0.84, 1, text_login, true, GeneralPanel.edit_background[1], tocolor(75, 75, 75, 255), 1, 1, false, tocolor(204, 204, 204, 255))

    local text_passwd = GetTextLand(language, "password")
    if XML["bool"] then text_passwd = XML["password"] end
    GeneralPanel.edit_background[2] = DGS:dgsCreateImage(0.41, 0.46, 0.17, 0.05, false, true, GeneralPanel.panel["login"], tocolor(204, 204, 204, 255))
    GeneralPanel.image[2] = DGS:dgsCreateImage(0, 0, 0.17, 1, "images/passwd.png", true, GeneralPanel.edit_background[2])
    GeneralPanel.edit[2] = DGS:dgsCreateEdit(0.17, 0, 0.84, 1, text_passwd, true, GeneralPanel.edit_background[2], tocolor(75, 75, 75, 255), 1, 1, false, tocolor(204, 204, 204, 255))

    if XML["bool"] then DGS:dgsEditSetMasked(GeneralPanel.edit[2], true) end


-- Register Panel
    GeneralPanel.panel["register"] = DGS:dgsCreateImage(0, 0, 1, 1, false, true, GeneralPanel.window[1], tocolor(68, 73, 77, 0))

    GeneralPanel.button[3] = DGS:dgsCreateButton(0.41, 0.55, 0.17, 0.05, GetTextLand(language, "register"), true, GeneralPanel.panel["register"], tocolor(255,255,255,255), false, false, ":DayZ_LoginPanel/images/button1.png", ":DayZ_LoginPanel/images/button2.png", ":DayZ_LoginPanel/images/button3.png", tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(255,255,255,255))
    GeneralPanel.button[4] = DGS:dgsCreateButton(0.41, 0.61, 0.17, 0.05, GetTextLand(language, "back_login"), true, GeneralPanel.panel["register"], tocolor(255,255,255,255), false, false, ":DayZ_LoginPanel/images/button1.png", ":DayZ_LoginPanel/images/button2.png", ":DayZ_LoginPanel/images/button3.png", tocolor(255,255,255,255), tocolor(255,255,255,255), tocolor(255,255,255,255))

    GeneralPanel.label[3] = DGS:dgsCreateLabel(0.41, 0.31, 0.17, 0.05, GetTextLand(language, "register_panel"), true, GeneralPanel.panel["register"], tocolor(255,255,255,255), false, false, false, false, false, "center", "bottom")

    GeneralPanel.edit_background[3] = DGS:dgsCreateImage(0.41, 0.37, 0.17, 0.05, false, true, GeneralPanel.panel["register"], tocolor(204, 204, 204, 255))
    GeneralPanel.edit_background[4] = DGS:dgsCreateImage(0.41, 0.43, 0.17, 0.05, false, true, GeneralPanel.panel["register"], tocolor(204, 204, 204, 255))
    GeneralPanel.edit_background[5] = DGS:dgsCreateImage(0.41, 0.49, 0.17, 0.05, false, true, GeneralPanel.panel["register"], tocolor(204, 204, 204, 255))
    
    GeneralPanel.edit[3] = DGS:dgsCreateEdit(0.17, 0, 0.84, 1, "Login     ", true, GeneralPanel.edit_background[3], tocolor(75, 75, 75, 255), 1, 1, false, tocolor(204, 204, 204, 255))
    GeneralPanel.edit[4] = DGS:dgsCreateEdit(0.17, 0, 0.84, 1, GetTextLand(language, "password"), true, GeneralPanel.edit_background[4], tocolor(75, 75, 75, 255), 1, 1, false, tocolor(204, 204, 204, 255))
    GeneralPanel.edit[5] = DGS:dgsCreateEdit(0.17, 0, 0.84, 1, GetTextLand(language, "repeat_password"), true, GeneralPanel.edit_background[5], tocolor(75, 75, 75, 255), 1, 1, false, tocolor(204, 204, 204, 255))  

    GeneralPanel.image[3] = DGS:dgsCreateImage(0, 0, 0.17, 1, "images/acc.png", true, GeneralPanel.edit_background[3])
    GeneralPanel.image[4] = DGS:dgsCreateImage(0, 0, 0.17, 1, "images/passwd.png", true, GeneralPanel.edit_background[4])
    GeneralPanel.image[5] = DGS:dgsCreateImage(0, 0, 0.17, 1, "images/passwd.png", true, GeneralPanel.edit_background[5])


-- Aesthetic activities
    DGS:dgsSetFont(GeneralPanel.label[1], font2)
    DGS:dgsSetFont(GeneralPanel.label[2], font)
    DGS:dgsSetFont(GeneralPanel.label[3], font2)

    for i=1,2 do
        DGS:dgsSetFont(GeneralPanel.edit[i], font3)
        DGS:dgsSetFont(GeneralPanel.button[i], font3)
        DGS:dgsSetFont(GeneralPanel.edit[i+2], font3)
        DGS:dgsSetFont(GeneralPanel.button[i+2], font3)
    end

    DGS:dgsSetFont(GeneralPanel.edit[5], font3)

    for i=1,5 do
        DGS:dgsSetProperty(GeneralPanel.edit[i], "caretColor", tocolor(0,0,0,255))
    end

    DGS:dgsSetVisible(GeneralPanel.panel["login"], false)
    DGS:dgsSetVisible(GeneralPanel.panel["register"], false)

    for i=1,2 do
        DGS:dgsSetVisible(GeneralPanel.window[i], false)
    end
end

local NegativeTable = {
    ["login"] = "register",
    ["register"] = "login",
}

function ChangeGui(gui)
    DGS:dgsSetVisible(GeneralPanel.panel[gui], true)
    DGS:dgsSetAlpha(GeneralPanel.panel[gui],0)
    DGS:dgsAlphaTo(GeneralPanel.panel[gui],1,false,"OutQuad",500)

    DGS:dgsAlphaTo(GeneralPanel.panel[NegativeTable[gui]],0,false,"OutQuad",500)
    setTimer(function() DGS:dgsSetVisible(GeneralPanel.panel[NegativeTable[gui]], false) end, 550, 1)
end

local tempTimer

-- Start Script function
function StartLoginPanel(lang)
    if login_panel_status then return end
    login_panel_status = true

    language = lang

    CreateGUI()

    music = playSound( "sound.mp3", true)
    setSoundVolume(music, 0)

    setTimer(function()
        local volume = getSoundVolume(music)
        setSoundVolume(music, volume+0.025)
    end,125,20)
    
    for i=1,2 do
        DGS:dgsSetVisible(GeneralPanel.window[i], true)
        DGS:dgsSetAlpha(GeneralPanel.window[i],0)
    end
    DGS:dgsSetVisible(GeneralPanel.image[6], true)
    DGS:dgsSetAlpha(GeneralPanel.image[6],0)

    DGS:dgsAlphaTo(GeneralPanel.window[1],1,false,"OutQuad",500)

    -- Logo animation
    setTimer(function()
        DGS:dgsAlphaTo(GeneralPanel.image[6],1,false,"OutQuad",1000)
    end, 1000, 1)

    setTimer(function()

        DGS:dgsAlphaTo(GeneralPanel.image[6],0,false,"OutQuad",1000)

        setTimer(function()
            DGS:dgsSetVisible(GeneralPanel.image[6], false)
        end, 1050, 1)

    end, 4000, 1)

    -- Login panel animation
    setTimer(function()
        
        DGS:dgsAlphaTo(GeneralPanel.window[2],1,false,"OutQuad",500)
        LoginPanel()
        showCursor(true)

    end, 5000, 1)

end

-- Login Panel
function LoginPanel()
    if act_panel == "login" then return end
    ChangeGui("login")
    act_panel = "login"
end


-- Register Panel
function RegisterPanel()
    if act_panel == "register" then return end
    ChangeGui("register")
    act_panel = "register"
end

-- Click functions
addEventHandler ( "onDgsMouseClick", root, function(button, state)
    -- AutoCompleting
    if DGS:dgsGetText(GeneralPanel.edit[1]) == "" then
        DGS:dgsSetText(GeneralPanel.edit[1], "Login     ")
    end
    if DGS:dgsGetText(GeneralPanel.edit[2]) == "" then
        DGS:dgsEditSetMasked(GeneralPanel.edit[2], false)
        DGS:dgsSetText(GeneralPanel.edit[2], GetTextLand(language, "password"))
    end
    if DGS:dgsGetText(GeneralPanel.edit[3]) == "" then
        DGS:dgsSetText(GeneralPanel.edit[3], "Login     ")
    end
    if DGS:dgsGetText(GeneralPanel.edit[4]) == "" then
        DGS:dgsEditSetMasked(GeneralPanel.edit[4], false)
        DGS:dgsSetText(GeneralPanel.edit[4], GetTextLand(language, "password"))
    end
    if DGS:dgsGetText(GeneralPanel.edit[5]) == "" then
        DGS:dgsEditSetMasked(GeneralPanel.edit[5], false)
        DGS:dgsSetText(GeneralPanel.edit[5], GetTextLand(language, "repeat_password"))
    end

    if (source == GeneralPanel.edit[1]) and (DGS:dgsGetText(GeneralPanel.edit[1]) == "Login     ") then
        DGS:dgsSetText(GeneralPanel.edit[1], "")
    end
    if (source == GeneralPanel.edit[2]) and (DGS:dgsGetText(GeneralPanel.edit[2]) == GetTextLand(language, "password")) then
        DGS:dgsEditSetMasked(GeneralPanel.edit[2], true)
        DGS:dgsSetText(GeneralPanel.edit[2], "")
    end
    if (source == GeneralPanel.edit[3]) and (DGS:dgsGetText(GeneralPanel.edit[3]) == "Login     ") then
        DGS:dgsSetText(GeneralPanel.edit[3], "")
    end
    if (source == GeneralPanel.edit[4]) and (DGS:dgsGetText(GeneralPanel.edit[4]) == GetTextLand(language, "password")) then
        DGS:dgsEditSetMasked(GeneralPanel.edit[4], true)
        DGS:dgsSetText(GeneralPanel.edit[4], "")
    end
    if (source == GeneralPanel.edit[5]) and (DGS:dgsGetText(GeneralPanel.edit[5]) == GetTextLand(language, "repeat_password")) then
        DGS:dgsEditSetMasked(GeneralPanel.edit[5], true)
        DGS:dgsSetText(GeneralPanel.edit[5], "")
    end

    if (source == GeneralPanel.checkbox[1]) then
        if DGS:dgsCheckBoxGetSelected(GeneralPanel.checkbox[1]) then
            if (DGS:dgsGetText(GeneralPanel.edit[2]) == GetTextLand(language, "password")) or (DGS:dgsGetText(GeneralPanel.edit[1]) == "Login     ") then DGS:dgsCheckBoxSetSelected(GeneralPanel.checkbox[1], false) return end
            xmlNodeSetAttribute(file,"values_bool","true")
			xmlNodeSetAttribute(file,"login",DGS:dgsGetText(GeneralPanel.edit[1]))
			xmlNodeSetAttribute(file,"password",DGS:dgsGetText(GeneralPanel.edit[2]))
            xmlSaveFile(file)
        else
            xmlNodeSetAttribute(file,"values_bool","false")
			xmlNodeSetAttribute(file,"login","")
			xmlNodeSetAttribute(file,"password","")
            xmlSaveFile(file)
        end
    end

    if button ~= "left" then return end
    if state ~= "up" then return end

    -- Buttons
    if source == GeneralPanel.button[2] then
        RegisterPanel()
    end

    if source == GeneralPanel.button[4] then
        LoginPanel()
    end

    if source == GeneralPanel.button[3] then
        if AntySpam then
            AntySpam = false
            setTimer(function() AntySpam = true end, 1500, 1)

            RegisterAccount()
        else
            exports.DayZ_notification:DrawNotification(GetTextLand(language, "anty_spam"), 212, 125, 125)
        end
    end

    if source == GeneralPanel.button[1] then
        if AntySpam then
            AntySpam = false
            setTimer(function() AntySpam = true end, 1500, 1)

            LoginAccount()
        else
            exports.DayZ_notification:DrawNotification(GetTextLand(language, "anty_spam"), 212, 125, 125)
        end
    end
end)

-- Control functions
function RegisterAccount()
    local login = DGS:dgsGetText(GeneralPanel.edit[3])
    local password = DGS:dgsGetText(GeneralPanel.edit[4])
    local password2 = DGS:dgsGetText(GeneralPanel.edit[5])

    if (login == "Login     ") or (password == GetTextLand(language, "password")) or (password2 == GetTextLand(language, "repeat_password")) then
        exports.DayZ_notification:DrawNotification(GetTextLand(language, "fields_empty"), 212, 125, 125)
        return
    end

    if password ~= password2 then
        exports.DayZ_notification:DrawNotification(GetTextLand(language, "passwords_wrong"), 212, 125, 125)
        return
    end

    triggerServerEvent("onPlayerRequestToRegisterAccount", resourceRoot, localPlayer, language, login, password)
end

function LoginAccount()
    local login = DGS:dgsGetText(GeneralPanel.edit[1])
    local password = DGS:dgsGetText(GeneralPanel.edit[2])

    if (login == "Login     ") or (password == GetTextLand(language, "password")) then
        exports.DayZ_notification:DrawNotification(GetTextLand(language, "fields_empty"), 212, 125, 125)
        return
    end

    triggerServerEvent("onPlayerRequestToLogin", resourceRoot, localPlayer, language, login, password)
end


-- Client Hide Event
addEvent("onPlayerHideLoginPanel",true)
addEventHandler("onPlayerHideLoginPanel",localPlayer,function(player)

    if localPlayer ~= player then return end

    if getElementData(localPlayer,'logedin') then 
        showCursor(false)
  
        DGS:dgsAlphaTo(GeneralPanel.panel[act_panel],0,false,"OutQuad",500)
        setTimer(function() DGS:dgsSetVisible(GeneralPanel.panel[act_panel], false) end, 550, 1)

        DGS:dgsAlphaTo(GeneralPanel.window[1],0,false,"OutQuad",500)
        setTimer(function() DGS:dgsSetVisible(GeneralPanel.window[1], false) end, 550, 1)
        showChat(true)

        setTimer(function()
            local volume = getSoundVolume(music)
            setSoundVolume(music, volume-0.05)
            if volume-0.05 < 0 then destroyElement(music) end
        end,250,10)
    end
end)

addEvent("onClientLogin", true)
