
local screenW, screenH = guiGetScreenSize()
local dxfont0_font = dxCreateFont("font.ttf", (screenH/768)*24)
local dxfont1_font = dxCreateFont("font.ttf", (screenH/768)*17)

local language = {
	['PL'] = {
		[1] = "Aktualna pula: ",
	},
	["ENG"] = {
		[1] = "Current pool: ",
	},

}


function totolotek()
	local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	local pula = getElementData(resourceRoot,"Totolotek_Pula") or 0
	dxDrawText("TOTOLOTEK", screenW * 0.0388, screenH * 0.5495, screenW * 0.1420, screenH * 0.5951, tocolor(0, 231, 212, 255), 1.00, dxfont0_font, "center", "center", false, false, false, false, false)
	dxDrawText(language[jezyk][1]..pula.." GP", screenW * 0.0205, screenH * 0.6081, screenW * 0.1611, screenH * 0.6458, tocolor(30, 233, 20, 255), 1.00, dxfont1_font, "left", "center", false, false, false, false, false)
end


addEvent("Totolotek_pokaz",true)
addEventHandler("Totolotek_pokaz",resourceRoot,function(arg)
	if arg then
		addEventHandler("onClientRender",root,totolotek)
	else
		removeEventHandler("onClientRender",root,totolotek)
	end
end)
