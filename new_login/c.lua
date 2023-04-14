
local sx, sy = guiGetScreenSize()

showCursor(true)
showChat(false)
local edited = 0

local forms = {
	["login"] = "",
	["pass"] = "",
}

local font = dxCreateFont("font.ttf",17*(sy/768))
local font2 = dxCreateFont("font.ttf",9*(sy/768))

local error_msg = "Tworząc konto akceptujesz regulamin serwera!"
local error_timer


function drawRenderPanel()
	if getElementData(localPlayer,'logedin') then return end
	dxDrawImage(0,0,sx * 1,sy * 1,"trojan")
	dxDrawRectangle(sx * 0.323,0,sx * 0.356,sy,tocolor(0,0,0,130))
	dxDrawLinedRectangle(sx * 0.323,0,sx * 0.356,sy,tocolor(0,0,0,255))
	dxDrawText(error_msg,sx * 0.323,sy * 0.3,sx * 0.673,sy * 0.5,_,1,font,"center","center")
	if edited ~= 1 and isMouseInPosition(sx * 0.34,sy * 0.45, sx * 0.32, sy * 0.05) then
		dxDrawRectangle(sx * 0.34,sy * 0.45, sx * 0.32, sy * 0.05,tocolor(109,109,109,150))
		dxDrawLinedRectangle(sx * 0.34,sy * 0.45, sx * 0.32, sy * 0.05,tocolor(0,0,0,255))
	elseif edited == 1 then
		dxDrawRectangle(sx * 0.34,sy * 0.45, sx * 0.32, sy * 0.05,tocolor(109,109,109,150))
		dxDrawLinedRectangle(sx * 0.34,sy * 0.45, sx * 0.32, sy * 0.05,tocolor(0,0,0,255))
	else
		dxDrawRectangle(sx * 0.34,sy * 0.45, sx * 0.32, sy * 0.05,tocolor(85,86,82,150))
		dxDrawLinedRectangle(sx * 0.34,sy * 0.45, sx * 0.32, sy * 0.05,tocolor(0,0,0,255))
	end
	if edited ~= 2 and isMouseInPosition(sx * 0.34,sy * 0.55, sx * 0.32, sy * 0.05) then
		dxDrawRectangle(sx * 0.34,sy * 0.55, sx * 0.32, sy * 0.05,tocolor(109,109,109,150))
		dxDrawLinedRectangle(sx * 0.34,sy * 0.55, sx * 0.32, sy * 0.05,tocolor(0,0,0,255))
	elseif edited == 2 then
		dxDrawRectangle(sx * 0.34,sy * 0.55, sx * 0.32, sy * 0.05,tocolor(109,109,109,150))
		dxDrawLinedRectangle(sx * 0.34,sy * 0.55, sx * 0.32, sy * 0.05,tocolor(0,0,0,255))
	else
		dxDrawRectangle(sx * 0.34,sy * 0.55, sx * 0.32, sy * 0.05,tocolor(85,86,82,150))
		dxDrawLinedRectangle(sx * 0.34,sy * 0.55, sx * 0.32, sy * 0.05,tocolor(0,0,0,255))
	end
	local width = dxGetTextWidth(forms["login"],1,"default-bold") * 1
	if forms["login"] == "" and edited ~= 1 then
		dxDrawText("Login",sx * 0.343,sy * 0.455, sx * 0.66, sy * 0.5,tocolor(255,255,255,130),1,"default-bold","left","center")
	else
		dxDrawText(forms["login"],sx * 0.343,sy * 0.455, sx * 0.66, sy * 0.5,tocolor(255,255,255,255),1,"default-bold","left","center")
	end
	if forms["pass"] == "" and edited ~= 2 then
		dxDrawText("Password",sx * 0.343,sy * 0.54, sx * 0.66, sy * 0.62,tocolor(255,255,255,130),1,"default-bold","left","center")
	else
		dxDrawText(forms["pass"]:gsub(".","*"),sx * 0.343,sy * 0.54, sx * 0.66, sy * 0.62,tocolor(255,255,255,255),1,"default-bold","left","center")
	end
	if isMouseInPosition(sx * 0.417,sy * 0.65, sx * 0.16, sy * 0.07) then
		dxDrawRectangle(sx * 0.417,sy * 0.65, sx * 0.16, sy * 0.07,tocolor(3, 138, 148,180))
	else
		dxDrawRectangle(sx * 0.417,sy * 0.65, sx * 0.16, sy * 0.07,tocolor(3, 138, 148,150))
	end
	if isMouseInPosition(sx * 0.417,sy * 0.74, sx * 0.16, sy * 0.07) then
		dxDrawRectangle(sx * 0.417,sy * 0.74, sx * 0.16, sy * 0.07,tocolor(3, 138, 148,180))
	else
		dxDrawRectangle(sx * 0.417,sy * 0.74, sx * 0.16, sy * 0.07,tocolor(3, 138, 148,150))
	end
	dxDrawLinedRectangle(sx * 0.417,sy * 0.65, sx * 0.16, sy * 0.07,tocolor(0,0,0,255))
	dxDrawLinedRectangle(sx * 0.417,sy * 0.74, sx * 0.16, sy * 0.07,tocolor(0,0,0,255))
	dxDrawText("Login",sx * 0.415,sy * 0.65,sx * 0.415 + sx * 0.16, sy * 0.65 + sy * 0.07,tocolor(255,255,255,255),1,font,"center","center")
	dxDrawText("Register",sx * 0.415,sy * 0.74, sx * 0.415 + sx * 0.16,sy * 0.74 + sy * 0.07,tocolor(255,255,255,255),1,font,"center","center")
	dxDrawLine(sx * 0.35,sy * 0.85,sx * 0.65, sy * 0.85,tocolor(255,255,255,200),3)
	dxDrawText("\nZalozycielem serwera jest: #ff0000Zgetek #ffffff i #FF0000Machin #FFFFFF\n Discord: #ff0000the-dayz.mtasa.eu/discord",sx * 0.35,sy * 0.85,sx * 0.65, sy * 0.9,_,1,font2,"center","center",false,false,false,true)
	
end
addEventHandler("onClientRender",root,drawRenderPanel)


function clearErrorMsg()
	error_msg = ""
end

function checkForms(typ)
	local test_text = {}
	test_text[1] = forms["login"]:gsub("%s","")
	test_text[2] = forms["pass"]:gsub("%s","")
	if typ == "login" then
		if forms["login"] == "" then
			error_msg = "Uzupełnij pole Login"
			if isTimer(error_timer) then killTimer(error_timer) end
			error_timer = setTimer(clearErrorMsg,3000,1)
		elseif forms["pass"] == ""  then
			error_msg = "Uzupełnij pole Hasło"
			if isTimer(error_timer) then killTimer(error_timer) end
			error_timer = setTimer(clearErrorMsg,3000,1)
		elseif test_text[1] == "" then
			error_msg = "Niepoprawny login"
			if isTimer(error_timer) then killTimer(error_timer) end
			error_timer = setTimer(clearErrorMsg,3000,1)
		end
	elseif typ == "register" then
		if forms["login"] == "" then
			error_msg = "Uzupełnij pole Login"
			if isTimer(error_timer) then killTimer(error_timer) end
			error_timer = setTimer(clearErrorMsg,3000,1)
		elseif forms["pass"] == ""  then
			error_msg = "Uzupełnij pole Hasło"
			if isTimer(error_timer) then killTimer(error_timer) end
			error_timer = setTimer(clearErrorMsg,3000,1)
		elseif test_text[1] == "" then
			error_msg = "Niepoprawny login"
			if isTimer(error_timer) then killTimer(error_timer) end
			error_timer = setTimer(clearErrorMsg,3000,1)
		end
	end
	return true
end


local timer

function removeChar()
	if not getKeyState("backspace") then return end
	if edited == 1 then
		forms["login"] = string.sub(forms["login"],1,string.len(forms["login"])-1)
	elseif edited == 2 then
		forms["pass"] = string.sub(forms["pass"],1,string.len(forms["pass"])-1)
	end
	if isTimer(timer) then killTimer(timer) end
	timer = setTimer(removeChar,100,1,z)
end



bindKey("backspace","down",removeChar)

function addCharToText(char)
	if edited == 1 then
		if forms["login"]:len() < 20 then
			forms["login"] = forms["login"]..char
		end
	elseif edited == 2 then
		if forms["pass"]:len() < 32 then
			forms["pass"] = forms["pass"]..char
		end
	end
end
addEventHandler("onClientCharacter",root,addCharToText)

addEvent("Login-AddTextManual",true)
addEventHandler("Login-AddTextManual",resourceRoot,function(text)
	error_msg = text
	if isTimer(error_timer) then killTimer(error_timer) end
	error_timer = setTimer(clearErrorMsg,3000,1)
end)

function mouseClickFunction(btn,state)
	if btn ~= "left" then return end
	if state ~= "down" then return end
	if isMouseInPosition(sx * 0.34,sy * 0.45, sx * 0.32, sy * 0.05) then
		edited = 1
	elseif isMouseInPosition(sx * 0.34,sy * 0.55, sx * 0.32, sy * 0.05) then
		edited = 2
	elseif isMouseInPosition(sx * 0.417,sy * 0.65, sx * 0.16, sy * 0.07) then
		if checkForms("login") then
			triggerServerEvent('Panel_Zaloguj',resourceRoot,localPlayer,forms["login"],forms["pass"])
		end
	elseif isMouseInPosition(sx * 0.417,sy * 0.74, sx * 0.16, sy * 0.07) then
		if checkForms("register") then
			triggerServerEvent('Panel_Zrob_Konto',resourceRoot,localPlayer,forms["login"],forms["pass"])
		end
	end
end
addEventHandler("onClientClick",root,mouseClickFunction)

addEvent("HideLogin-Manual",true)
addEventHandler("HideLogin-Manual",resourceRoot,function()
	removeEventHandler("onClientRender",root,drawRenderPanel)
	removeEventHandler("onClientCharacter",root,addCharToText)
	removeEventHandler("onClientClick",root,mouseClickFunction)
	unbindKey("backspace","down",removeChar)
	showCursor(false)
	showChat(true)
end)



setTimer(function()
	if getElementData(localPlayer,'logedin') then 
		triggerEvent("HideLogin-Manual",resourceRoot)
	end
end,500,1)

function dxDrawLinedRectangle( x, y, width, height, color, _width, postGUI )
	_width = _width or 1
	dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
	dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
	dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
	return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end

function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
		return false
	end
	local sx, sy = guiGetScreenSize ( )
	local cx, cy = getCursorPosition ( )
	local cx, cy = ( cx * sx ), ( cy * sy )
	
	return ( ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) )
end