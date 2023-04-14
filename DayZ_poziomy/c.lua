

local screenW, screenH = guiGetScreenSize()

local font = dxCreateFont("Foul_Fiend.ttf",16*(screenH/768))
local font2 = dxCreateFont("exp_font.ttf",14*(screenH/768))

local nastepny_poziom_exp = {
	[1] = 0,
	[2] = 300,
	[3] = 600,
	[4] = 1100,
	[5] = 1650,
	[6] = 2300,
	[7] = 3000,
	[8] = 3900,
	[9] = 4900,
	[10] = 6000,
	[11] = 7200,
	[12] = 9500,
	[13] = 11350,
	[14] = 12850,
	[15] = 14450,
	[16] = 16200,
	[17] = 18100,
	[18] = 20300,
	[19] = 23300,
}


local language = {
	["PL"] = {
		["Poziom"] = "Poziom",
		["Max"] = "Maks. Poziom",
	},
	["ENG"] = {
		["Poziom"] = "LVL",
		["Max"] = "MAX LVL",
	}
}

function GetExpNeedToLevel(lvl)
	if not nastepny_poziom_exp[lvl] then
		return 300
	end

	return nastepny_poziom_exp[lvl];
end

--[[function dxDrawLinedRectangle( x, y, width, height, color, _width, postGUI )
	_width = _width or 1
	dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
	dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
	dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
	return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end

addEvent("onClientLogin", true)
addEventHandler("onClientLogin", root, function()
addEventHandler("onClientRender", root,
    function()
        local exp = getElementData(localPlayer,"EXP") or 0
		local lvl = getElementData(localPlayer,"LVL") or 1
		local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
		local max_rece = screenW * 0.1384
		dxDrawRectangle(screenW * 0.015, screenH * 0.7088, max_rece, screenH * 0.0352, tocolor(0, 0, 0, 125), false)
		dxDrawLinedRectangle(screenW * 0.015, screenH * 0.7088, max_rece, screenH * 0.0352,tocolor(0,0,0,200),1,true)
		if lvl == 20 then
			dxDrawRectangle(screenW * 0.015, screenH * 0.7088,0, screenH * 0.0352, tocolor(0, 255, 0, 125), false)
		else	
			dxDrawRectangle(screenW * 0.015, screenH * 0.7088,max_rece * (exp/nastepny_poziom_exp[lvl]), screenH * 0.0352, tocolor(0, 255, 0, 125), false)
		end
        dxDrawText(language[jezyk]["Poziom"]..": "..lvl, screenW * -0.79, screenH * 0.4158, screenW * 0.9224, screenH * 0.9688, tocolor(255, 255, 255, 255), 1.00,font, "center", "center", false, false, false, false, false)
		local percent = string.format("%.02f",(exp/nastepny_poziom_exp[lvl] * 100))
		if lvl == 20 then
			dxDrawText(language[jezyk]["Max"], screenW* -0.75, screenH * 0.4650, screenW* 0.92, screenH * 0.99, tocolor(255, 255, 255, 255), 0.80,font2, "center", "center", false, false, true, false, false)
		else	
			dxDrawText(percent.."%", screenW* -0.75, screenH * 0.4650, screenW* 0.92, screenH * 0.99, tocolor(255, 255, 255, 255), 0.80,font2, "center", "center", false, false, true, false, false)
			
		end
	end
)
end)]]




local gui = {}
gui["Label"] = {}
gui["Checkbox"] = {}
gui["Window"] = guiCreateWindow(0.35, 0.34, 0.31, 0.35, "Umiejętności", true)
guiWindowSetMovable(gui["Window"], false)
guiWindowSetSizable(gui["Window"], false)


guiCreateStaticImage(0,0.46,0.1,0.02,"uop.png",true,gui["Window"])

for i=1,8 do
	guiCreateStaticImage(0.14*(i-0.9),0.46,0.1,0.02,"uop.png",true,gui["Window"])
end

local gui_to_opcje = {}

gui["Label"][1] = guiCreateLabel(0.05, 0.18, 0.32, 0.06, "Poziom: 5", true, gui["Window"])
guiLabelSetHorizontalAlign(gui["Label"][1], "center", false)

gui["Checkbox"]["Noz"] = guiCreateCheckBox(0.04, 0.25, 0.33, 0.06, "Nóż", false, true, gui["Window"])
gui_to_opcje[gui["Checkbox"]["Noz"]] = {"Opcja 1","Umiejetnosc_1"}
gui["Checkbox"]["Maly plecak"] = guiCreateCheckBox(0.04, 0.35, 0.33, 0.06, "Mały plecak", false, true, gui["Window"])
gui_to_opcje[gui["Checkbox"]["Maly plecak"]] = {"Opcja 2","Umiejetnosc_1"}
setElementData(gui["Checkbox"]["Noz"],"gui_przeciwnik",gui["Checkbox"]["Maly plecak"],false)
setElementData(gui["Checkbox"]["Maly plecak"],"gui_przeciwnik",gui["Checkbox"]["Noz"],false)
gui["Label"][2] = guiCreateLabel(0.56, 0.18, 0.32, 0.06, "Poziom: 10", true, gui["Window"])
guiLabelSetHorizontalAlign(gui["Label"][2], "center", false)
gui["Checkbox"]["+500 krwi"] = guiCreateCheckBox(0.56, 0.25, 0.33, 0.06, "+500 Krwi", false, true, gui["Window"])
gui_to_opcje[gui["Checkbox"]["+500 krwi"]] = {"Opcja 1","Umiejetnosc_2"}
gui["Checkbox"]["Sredni plecak"] = guiCreateCheckBox(0.56, 0.35, 0.33, 0.06, "Średni plecak", false, true, gui["Window"])
gui_to_opcje[gui["Checkbox"]["Sredni plecak"]] = {"Opcja 2","Umiejetnosc_2"}
setElementData(gui["Checkbox"]["+500 krwi"],"gui_przeciwnik",gui["Checkbox"]["Sredni plecak"],false)
setElementData(gui["Checkbox"]["Sredni plecak"],"gui_przeciwnik",gui["Checkbox"]["+500 krwi"],false)
gui["Label"][3] = guiCreateLabel(0.05, 0.51, 0.32, 0.06, "Poziom: 15", true, gui["Window"])
guiLabelSetHorizontalAlign(gui["Label"][3], "center", false)
gui["Checkbox"]["Medic kit"] = guiCreateCheckBox(0.04, 0.60, 0.33, 0.06, "Medic kit", false, true, gui["Window"])
gui_to_opcje[gui["Checkbox"]["Medic kit"]] = {"Opcja 1","Umiejetnosc_3"}
gui["Checkbox"]["Regeneracja HP"] = guiCreateCheckBox(0.04, 0.70, 0.33, 0.06, "Regeneracja HP", false, true, gui["Window"])
gui_to_opcje[gui["Checkbox"]["Regeneracja HP"]] = {"Opcja 2","Umiejetnosc_3"}
setElementData(gui["Checkbox"]["Medic kit"],"gui_przeciwnik",gui["Checkbox"]["Regeneracja HP"],false)
setElementData(gui["Checkbox"]["Regeneracja HP"],"gui_przeciwnik",gui["Checkbox"]["Medic kit"],false)
gui["Label"][4] = guiCreateLabel(0.56, 0.51, 0.32, 0.06, "Poziom: 20", true, gui["Window"])
guiLabelSetHorizontalAlign(gui["Label"][4], "center", false)
gui["Checkbox"]["+300 krwi + sikiera"] = guiCreateCheckBox(0.56, 0.60, 0.33, 0.06, "+300 krwi + Sikiera", false, true, gui["Window"])
gui_to_opcje[gui["Checkbox"]["+300 krwi + sikiera"]] = {"Opcja 1","Umiejetnosc_4"}
gui["Checkbox"]["homo niewiadomo"] = guiCreateCheckBox(0.56, 0.70, 0.33, 0.06, "Skill na Ghilli", false, true, gui["Window"])
gui_to_opcje[gui["Checkbox"]["homo niewiadomo"]] = {"Opcja 2","Umiejetnosc_4"}
setElementData(gui["Checkbox"]["+300 krwi + sikiera"],"gui_przeciwnik",gui["Checkbox"]["homo niewiadomo"],false)
setElementData(gui["Checkbox"]["homo niewiadomo"],"gui_przeciwnik",gui["Checkbox"]["+300 krwi + sikiera"],false)
gui["button"] = guiCreateButton(0.35, 0.87, 0.31, 0.10, "Zapisz", true, gui["Window"])    
guiSetVisible(gui["Window"],false)
guiSetProperty(gui["button"],"NormalTextColour","FFF2DD20")
guiSetProperty(gui["Window"],"CaptionColour","FF00CCCC")

for i=1,4 do
	guiLabelSetColor(gui["Label"][i],51, 204, 51)
end

local zablokuj = {
	[5] = {
		["Opcja 1"] = {gui["Checkbox"]["Maly plecak"],gui["Checkbox"]["Noz"]},
		["Opcja 2"] = {gui["Checkbox"]["Noz"],gui["Checkbox"]["Maly plecak"]},
	},
	[10] = {
		["Opcja 1"] = {gui["Checkbox"]["Sredni plecak"],gui["Checkbox"]["+500 krwi"]},
		["Opcja 2"] = {gui["Checkbox"]["+500 krwi"],gui["Checkbox"]["Sredni plecak"]},
	},
	[15] = {
		["Opcja 1"] = {gui["Checkbox"]["Regeneracja HP"],gui["Checkbox"]["Medic kit"]},
		["Opcja 2"] = {gui["Checkbox"]["Medic kit"],gui["Checkbox"]["Regeneracja HP"]},
	},
	[20] = {
		["Opcja 1"] = {gui["Checkbox"]["homo niewiadomo"],gui["Checkbox"]["+300 krwi + sikiera"]},
		["Opcja 2"] = {gui["Checkbox"]["+300 krwi + sikiera"],gui["Checkbox"]["homo niewiadomo"]},
	}
}

local lvl_to_umiejetnosci = {
	[5] = "Umiejetnosc_1",
	[10] = "Umiejetnosc_2",
	[15] = "Umiejetnosc_3",
	[20] = "Umiejetnosc_4",
}

local language2 = {
	['PL'] = {
		['save'] = "Zapisz",
		['umiejetnosci'] = "Umiejętności",
		['lvl5'] = "Poziom: 5",
		['lvl10'] = "Poziom: 10",
		['lvl15'] = "Poziom: 15",
		['lvl20'] = "Poziom: 20",
		['kosa'] = "Nóż",
		['malyplecak'] = "Mały plecak",
		['sredniplecak'] = "Średni plecak",
		['krew'] = "+500 krwi",
		['regeneracja'] = "Regeneracja krwi",
		['sikiera'] = "+300 krwi + sikiera",
		['homo niewiadomo'] = "Kamuflaż snipera",
	},
	['ENG'] = {
		['save'] = "Save",
		['umiejetnosci'] = "Skills",
		['lvl5'] = "Level: 5",
		['lvl10'] = "Level: 10",
		['lvl15'] = "Level: 15",
		['lvl20'] = "Level: 20",
		['kosa'] = "Knife",
		['malyplecak'] = "Small backpack",
		['sredniplecak'] = "Medium backpack",
		['krew'] = "+500 blood",
		['regeneracja'] = "Blood regeneration",
		['sikiera'] = "+300 blood + ax",
		['homo niewiadomo'] = "Sniper camouflage",
	},
}

function refresz2()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiSetText(gui["button"], language2[jezyk]['save'])
	guiSetText(gui['Window'], language2[jezyk]['umiejetnosci'])
	guiSetText(gui["Label"][1], language2[jezyk]['lvl5'])
	guiSetText(gui["Label"][2], language2[jezyk]['lvl10'])
	guiSetText(gui["Label"][3], language2[jezyk]['lvl15'])
	guiSetText(gui["Label"][4], language2[jezyk]['lvl20'])
	guiSetText(gui["Checkbox"]["Noz"], language2[jezyk]['kosa'])
	guiSetText(gui["Checkbox"]["Maly plecak"], language2[jezyk]['malyplecak'])
	guiSetText(gui["Checkbox"]["+500 krwi"], language2[jezyk]['krew'])
	guiSetText(gui["Checkbox"]["Sredni plecak"], language2[jezyk]['sredniplecak'])
	guiSetText(gui["Checkbox"]["Regeneracja HP"], language2[jezyk]['regeneracja'])
	guiSetText(gui["Checkbox"]["+300 krwi + sikiera"], language2[jezyk]['sikiera'])
	guiSetText(gui["Checkbox"]["homo niewiadomo"], language2[jezyk]['homo niewiadomo'])
end

function refresh ()
	local lvl = getElementData(localPlayer,'LVL') or 1
	
	for i,v in pairs({5,10,15,20}) do
		if lvl >= v then
			local umiejetnosc = lvl_to_umiejetnosci[v]
			local zablokowane = zablokuj[v]
			local bylo = false
			for key,value in pairs(zablokowane) do
				if not bylo then
					guiSetEnabled(value[1],true)
					guiSetEnabled(value[2],true)
					guiCheckBoxSetSelected(value[1],false)
					guiCheckBoxSetSelected(value[2],false)
					guiSetProperty(value[2],"RiseOnClick","true")
					guiSetProperty(value[1],"RiseOnClick","true")
					if getElementData(localPlayer,umiejetnosc) == key then
						guiSetEnabled(value[1],false)
						guiSetEnabled(value[2],true)
						bylo = true
						guiSetProperty(value[2],"RiseOnClick","false")
						guiCheckBoxSetSelected(value[2],true)
						guiCheckBoxSetSelected(value[1],false)
					end
				end
			end
		else
			local zablokowane = zablokuj[v]
			for key,value in pairs(zablokowane) do
				guiSetEnabled(value[1],false)
				guiSetEnabled(value[2],false)
				guiCheckBoxSetSelected(value[2],false)
				guiCheckBoxSetSelected(value[1],false)
			end
		end
	end
end

for i=1,4 do
	setElementData(localPlayer,"Umiejetnosc_"..i,nil)
end

function open()
	local state = guiGetVisible(gui['Window'])
	refresh()
	refresz2()
	guiSetVisible(gui["Window"],not state)
	showCursor(not state)
end
bindKey("F6","down",open)

addEventHandler("onClientGUIClick",resourceRoot,function(state)
	if getElementType(source) == "gui-checkbox" then
		local przeciwnik = getElementData(source,"gui_przeciwnik")
		guiCheckBoxSetSelected(przeciwnik,false)
	elseif source == gui['button'] then
		if state ~="left" then return end
		for k,v in pairs(gui["Checkbox"]) do
			if guiCheckBoxGetSelected(v) then
				local info = gui_to_opcje[v]
				setElementData(localPlayer,info[2],info[1])
				guiSetVisible(gui["Window"],false)
				showCursor(false)
			end
		end
	end
end)

function getMaxHealth(player)
	if not player then return end
	local added_blood = 0
	if getElementData(player,"Umiejetnosc_2") ==  "Opcja 1" then
		added_blood = added_blood + 500
	end
	if getElementData(player,"Umiejetnosc_4") ==  "Opcja 1" then
		added_blood = added_blood + 300
	end
	return added_blood
end

