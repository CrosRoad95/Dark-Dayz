-- FILE: 	mapEditorScriptingExtension_c.lua
-- PURPOSE:	Prevent the map editor feature set being limited by what MTA can load from a map file by adding a script file to maps
-- VERSION:	RemoveWorldObjects (v1) AutoLOD (v1) BreakableObjects (v1)

function requestLODsClient()
	triggerServerEvent("requestLODsClient", resourceRoot)
end
addEventHandler("onClientResourceStart", resourceRoot, requestLODsClient)

function setLODsClient(lodTbl)
	for i, model in ipairs(lodTbl) do
		engineSetModelLODDistance(model, 300)
	end
end
addEvent("setLODsClient", true)
addEventHandler("setLODsClient", resourceRoot, setLODsClient)

function applyBreakableState()
	for k, obj in pairs(getElementsByType("object", resourceRoot)) do
		local breakable = getElementData(obj, "breakable")
		if breakable then
			setObjectBreakable(obj, breakable == "true")
		end
	end
end
addEventHandler("onClientResourceStart", resourceRoot, applyBreakableState)



local typ_akcji

local gui = {}
gui['Window'] = guiCreateWindow(0.37, 0.34, 0.25, 0.31, "ZomboTech", true)
guiWindowSetMovable(gui['Window'], false)
guiWindowSetSizable(gui['Window'], false)

gui['Wejdz'] = guiCreateButton(0.03, 0.78, 0.32, 0.17, "Enter", true, gui['Window'])
gui['Zamknij'] = guiCreateButton(0.63, 0.78, 0.32, 0.17, "Close", true, gui['Window'])
gui['Notka'] = guiCreateLabel(0.01, 0.09, 0.96, 0.65, "If you enter without \"Kombinezon X\" your blood will go down", true, gui['Window'])
guiLabelSetHorizontalAlign(gui['Notka'], "center", true)
guiLabelSetVerticalAlign(gui['Notka'], "center")    
guiSetVisible(gui['Window'],false)

local language = {
	['wejdz'] = {
		["PL"] = {
			["Wejdz"] = "Wejdz",
			["Zamknij"] = "Zamknij",
			['Notka'] = "Jeśli wejdziesz do środka bez kombinezonu X, Twoja krew będzie się zmniejszała",
		},
		['ENG'] = {
			["Wejdz"] = "Enter",
			["Zamknij"] = "Close",
			['Notka'] = "If you enter without \"Kombinezon X\" your blood will go down",
		},
	},
	['wyjdz'] = {
		["PL"] = {
			["Wejdz"] = "Wyjdz",
			["Zamknij"] = "Zamknij",
			['Notka'] = "",
		},
		['ENG'] = {
			["Wejdz"] = "Leave",
			["Zamknij"] = "Close",
			['Notka'] = "",
		},
	},
}

local typy_to_cele = {
	['wejdz'] = {
		['tp'] = function()
			guiSetVisible(gui['Window'],false)
			showCursor(false)
			triggerServerEvent('warpTo',resourceRoot,localPlayer,-1981.5146484375,679.65856933594,1.0046873092651)
		end,
	},
	['wyjdz'] = {
		['tp'] = function()
			guiSetVisible(gui['Window'],false)
			showCursor(false)
			triggerServerEvent('warpTo',resourceRoot,localPlayer,-1964.8251953125,642.99609375,46.5625)
		end,
	},
}


function refreshLanguage()
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	for i,v in pairs(gui) do
		if language[typ_akcji][jezyk][i] then
			guiSetText(v,language[typ_akcji][jezyk][i])
		end
	end
end

addEvent("PokazPanelZombo",true)
addEventHandler("PokazPanelZombo",resourceRoot,function(state,typ)
	typ_akcji = typ
	guiSetVisible(gui['Window'],state)
	showCursor(state)
	refreshLanguage()
end)

addEventHandler('onClientGUIClick',gui['Wejdz'],function(state)
	if state~='left' then return end
	typy_to_cele[typ_akcji]['tp']()
end,false)

addEventHandler('onClientGUIClick',gui['Zamknij'],function(state)
	if state~='left' then return end
	showCursor(false)
	guiSetVisible(gui['Window'],false)
end,false)


--exports.DayZ_customblips:createCustomBlip ( -1950.0185546875,673.158203125, 16, 16, "zombo.png" )

