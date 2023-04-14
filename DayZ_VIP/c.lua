
local skrzynka_tekst = {
	[[
	• 0 PP
	• 10 PP
	• 20 PP
	• 30 PP
	• 40 PP
	• 50 PP
	]],[[
	• 100 GP
	• 200 GP
	• 300 GP
	• 500 GP
	• 700 GP
	• 1000 GP
	]],
}


local gui = {}

gui['Window'] = guiCreateWindow(0.37, 0.24, 0.25, 0.53, "Kupno VIP oraz skrzynek", true)
guiWindowSetMovable(gui['Window'], false)
guiWindowSetSizable(gui['Window'], false)
gui["tabPanel"] = guiCreateTabPanel(0,0.05,1,1,true,gui['Window'])
gui["tab_1"] = guiCreateTab("VIP",gui['tabPanel'])
gui['Uslugi'] = guiCreateGridList(0.03, 0.06, 0.90, 0.25, true, gui["tab_1"])
guiGridListAddColumn(gui['Uslugi'], "Usługa", 0.9)
gui['Przedluz'] = guiCreateButton(0.03, 0.33, 0.90, 0.05, "Przedłuż konto VIP o 30 dni(10PP)", true, gui["tab_1"])
guiCreateStaticImage(0.03, 0.41, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.18, 0.41, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.34, 0.41, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.50, 0.41, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.66, 0.41, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.81, 0.41, 0.13, 0.02, "uop.png", true, gui["tab_1"])
gui['Liczba_PP'] = guiCreateLabel(0.04, 0.45, 0.4, 0.04, "Posiadasz: 0 PP", true, gui["tab_1"])
gui['scamnahajs'] = guiCreateLabel(0.04, 0.50, 0.55, 0.04, "Możesz je kupić (10 punktów)", true, gui["tab_1"])
--gui["Tekst_end"] = guiCreateLabel(0.04, 0.55, 0.37, 0.04, "Pozostało dni do końca:", true, gui["tab_1"])
--gui["Tekst_end1"] = guiCreateLabel(0.43, 0.55, 0.37, 0.04, "20", true, gui["tab_1"])
--gui["Colored_PIN"] = guiCreateLabel(0.04, 0.60, 0.10, 0.04, "----", true, gui["tab_1"])
--guiLabelSetColor(gui["Colored_PIN"], 236, 214, 22)
--guiCreateLabel(0.15, 0.60, 0.16, 0.04, "na numer", true, gui["tab_1"])
--gui['Colored_numer'] = guiCreateLabel(0.31, 0.60, 0.10, 0.04, "----", true, gui["tab_1"])
--guiLabelSetColor(gui['Colored_numer'], 236, 214, 22)
--guiLabelSetColor(gui['Tekst_end1'], 236, 214, 22)
gui['Button_sprawdz_kod'] = guiCreateButton(0.66, 0.56, 0.25, 0.08, "Sprawdz Bonus", true, gui["tab_1"])
guiSetProperty(gui['Button_sprawdz_kod'],"NormalTextColour", "FF27C937")	
guiSetProperty(gui['Przedluz'],"NormalTextColour", "FF27C937")	
gui['Kod_zwrotny'] = guiCreateEdit(0.63, 0.48, 0.31, 0.08, "", true, gui["tab_1"])
guiCreateStaticImage(0.03, 0.67, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.18, 0.67, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.34, 0.67, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.50, 0.67, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.66, 0.67, 0.13, 0.02, "uop.png", true, gui["tab_1"])
guiCreateStaticImage(0.81, 0.67, 0.13, 0.02, "uop.png", true, gui["tab_1"])
--gui['Normal_text_1'] = guiCreateLabel(0.025, 0.71, 0.96, 0.16, "Płatność SMS obsługuje serwis serverproject. W przypadku reklamacji skontaktuj się z właścicielem serwera. Korzystanie jest równoznaczne z akceptacją regulaminu.", true, gui["tab_1"])
--guiLabelSetHorizontalAlign(gui['Normal_text_1'], "left", true)

gui['Normal_text_2'] = guiCreateLabel(0.025, 0.71, 0.96, 0.16, "W przypadku otrzymania statusu BAN, administracja nie przewiduje reklamacji. Przed zakupem przemyśl dwa razy!", true, gui["tab_1"])
guiLabelSetColor(gui['Normal_text_2'], 253, 0, 0)
guiLabelSetHorizontalAlign(gui['Normal_text_2'], "left", true)    

local GUIEditor = {
	label = {},
}
gui["tab_2"] = guiCreateTab("Skrzynki",gui['tabPanel'])

guiCreateStaticImage(0.03, 0.44, 0.13, 0.02, "uop.png", true, gui["tab_2"])
guiCreateStaticImage(0.18, 0.44, 0.13, 0.02, "uop.png", true, gui["tab_2"])
guiCreateStaticImage(0.34, 0.44, 0.13, 0.02, "uop.png", true, gui["tab_2"])
guiCreateStaticImage(0.50, 0.44, 0.13, 0.02, "uop.png", true, gui["tab_2"])
guiCreateStaticImage(0.66, 0.44, 0.13, 0.02, "uop.png", true, gui["tab_2"])
guiCreateStaticImage(0.81, 0.44, 0.13, 0.02, "uop.png", true, gui["tab_2"])

GUIEditor.label[10] = guiCreateLabel(0.02, 0.03, 0.95, 0.04, "Koszt otwarcia skrzynki: 5 PP", true, gui["tab_2"])
guiLabelSetColor(GUIEditor.label[10], 0, 250, 0)
GUIEditor.label[11] = guiCreateLabel(0.02, 0.10, 0.95, 0.04, "W skrzynce może znajdować się:", true, gui["tab_2"])
guiLabelSetColor(GUIEditor.label[11], 249, 246, 0)
GUIEditor.label[12] = guiCreateLabel(0.02, 0.14, 0.95, 0.25, skrzynka_tekst[1], true, gui["tab_2"])
guiLabelSetColor(GUIEditor.label[12], 30, 194, 218)
GUIEditor.label[12] = guiCreateLabel(0.3, 0.14, 0.95, 0.25, skrzynka_tekst[2], true, gui["tab_2"])
guiLabelSetColor(GUIEditor.label[12], 30, 194, 218)
gui["Skrzynka_los"] = guiCreateButton(0.20, 0.50, 0.58, 0.11, "Otwórz skrzynie", true, gui["tab_2"])
guiSetProperty(gui['Skrzynka_los'], "NormalTextColour", "FF00FF00")
GUIEditor.label[13] = guiCreateLabel(0.02, 0.66, 0.97, 0.10, "Administracja nie przyjmuje reklamacji! Ze wszelakimi pytanami proszę udać się do administracji!", true, gui["tab_2"])
guiLabelSetColor(GUIEditor.label[13], 255, 0, 0)
guiLabelSetHorizontalAlign(GUIEditor.label[13], "center", true)
GUIEditor.label[14] = guiCreateLabel(0.02, 0.78, 0.97, 0.22, "\n• Graj z głową!\n• Niepoprawne działanie skryptu zgłoś do administracji", true, gui["tab_2"])
guiLabelSetColor(GUIEditor.label[14], 254, 101, 0)
guiLabelSetHorizontalAlign(GUIEditor.label[14], "left", true)    


guiSetVisible(gui['Window'], false)

local language2 = {
	['PL'] = {
		['kupno'] = "Kupno VIP oraz skrzynek",
		['usluga'] = "Usługa",
		['przedluz'] = "Przedłuż konto VIP o 30 dni(10PP)",
		['bonus'] = "Sprawdz Bonus",
		['kuppp'] = "Możesz je kupić (10 punktów)",
		['bann'] = "W przypadku otrzymania statusu BAN, administracja nie przewiduje reklamacji. Przed zakupem przemyśl dwa razy!",
		--['posiadaniepp'] = "Sprawdz Bonus",
		
		['case'] = "Skrzynki",
		['case2'] = "Koszt otwarcia skrzynki: 5 PP",
		['case3'] = "W skrzynce może znajdować się:",
		['case4'] = "Otwórz skrzynie",
		['case5'] = "Administracja nie przyjmuje reklamacji! Ze wszelakimi pytanami proszę udać się do administracji!",
		['case6'] = "\n• Graj z głową!\n• Niepoprawne działanie skryptu zgłoś do administracji",
	},
	['ENG'] = {
		['kupno'] = "Purchase of VIPs and cases",
		['usluga'] = "Service",
		['przedluz'] = "Extend your VIP account by 30 days (10PP)",
		['bonus'] = "Check Bonus",
		['kuppp'] = "You can buy them (10 points)",
		['bann'] = "In the event of receiving the BAN status, the administration does not provide for a complaint. Please think twice before buying!",
		--['posiadaniepp'] = "Check Bonus",
		
		['case'] = "Cases",
		['case2'] = "Chest opening cost: 5 PP",
		['case3'] = "The box may contain:",
		['case4'] = "Open the case",
		['case5'] = "The administration does not accept complaints! Please go to the administration with any questions!",
		['case6'] = "\n• Play smart!\n• Report incorrect operation of the script to the administration",
	},
}

function refresz()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiGridListSetColumnTitle(gui['Uslugi'],1, language2[jezyk]['usluga'])
	guiSetText(gui['Window'], language2[jezyk]['kupno'])
	guiSetText(gui['Przedluz'], language2[jezyk]['przedluz'])
	guiSetText(gui['Button_sprawdz_kod'], language2[jezyk]['bonus'])
	--guiSetText(gui['Liczba_PP'], language2[jezyk]['posiadaniepp'])
	guiSetText(gui['scamnahajs'], language2[jezyk]['kuppp'])
	guiSetText(gui['Normal_text_2'], language2[jezyk]['bann'])
	guiSetText(gui['tab_2'], language2[jezyk]['case'])
	guiSetText(GUIEditor.label[10], language2[jezyk]['case2'])
	guiSetText(GUIEditor.label[11], language2[jezyk]['case3'])
	guiSetText(GUIEditor.label[13], language2[jezyk]['case5'])
	guiSetText(GUIEditor.label[14], language2[jezyk]['case6'])
	guiSetText(gui["Skrzynka_los"], language2[jezyk]['case4'])
end

local language = {
	["PL"] = {
		["Nie masz PP"] = "* Nie masz wystarczająco PP",
	},
	["ENG"] = {
		["Nie masz PP"] = "* You don't have enought PP",
	},
}
addEventHandler("onClientGUIClick",gui["Skrzynka_los"],function(l)
	if l ~= "left" then return end
	local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	if (getElementData(localPlayer,"PP") or 0) < 5 then outputChatBox(language[jezyk]["Nie masz PP"],255,0,0) return end
	triggerServerEvent("Skrzynka:losuj",resourceRoot,localPlayer)
end,false)

addEventHandler("onClientGUIClick",gui["Przedluz"],function(state)
	if state ~= "left" then return end
	triggerServerEvent("KupVipa",resourceRoot,localPlayer)
end,false)


local kategorie = {
	{'Zestaw medyczny'},
	{'Zestaw prowiantu'},
	{'Zestaw mechanika'},
	{'Plecak 32 sloty'},
}

local kategorie2 = {
	{'Medical kit'},
	{'Provision set'},
	{'Mechanic kit'},
	{'Backpack 32 slots'},
}


function refreshGrid()
local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiSetInputMode("no_binds_when_editing")
	guiGridListClear(gui['Uslugi'])
	if jezyk =="PL" then
			for i,v in pairs(kategorie) do
				local row = guiGridListAddRow(gui['Uslugi'])
				guiGridListSetItemText(gui['Uslugi'],row,1,v[1],false,false)
				guiGridListSetItemData(gui['Uslugi'],row,1,v[1])
			end
		else
			for i,v in pairs(kategorie2) do
				local row = guiGridListAddRow(gui['Uslugi'])
				guiGridListSetItemText(gui['Uslugi'],row,1,v[1],false,false)
				guiGridListSetItemData(gui['Uslugi'],row,1,v[1])
			end
		end	
end
addEvent("VIP_odswiezDane",true)
addEventHandler("VIP_odswiezDane",resourceRoot,refreshGrid)

addEventHandler("onClientGUIDoubleClick",gui['Uslugi'],function()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	local itemData = guiGridListGetItemData(gui['Uslugi'],guiGridListGetSelectedItem(gui['Uslugi']),1)
	if itemData then
		if not getElementData(localPlayer,"VIP") then
		if jezyk =="PL" then
			outputChatBox("* Nie posiadasz konta VIP!",255,255,255)
		else
			outputChatBox("* You do not have a VIP account!",255,255,255)
		end	
			return
		end
		triggerServerEvent("VIP_GiveItem",resourceRoot,localPlayer,itemData)
	end
end,false)

function openPanel()
	local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	for i,v in pairs(language[jezyk]) do
		if gui[i] and i ~= gui['Liczba_PP'] then
			guiSetText(i,v)
		elseif gui[i] then
			local tekst = string.format(v,(getElementData(localPlayer,'PP') or 0))
			guiSetText(gui["Liczba_PP"],tekst)
		end
	end
      	--guiSetText(gui["Tekst_end1"],(getElementData(localPlayer,"VIP") or 0))
	if jezyk =="PL" then
		guiSetText(gui['Liczba_PP'],"Posiadasz: "..(getElementData(localPlayer,'PP') or 0).." PP") 
	else
		guiSetText(gui['Liczba_PP'],"You have: "..(getElementData(localPlayer,'PP') or 0).." PP") 
	end	
	local state = guiGetVisible(gui['Window'])
	refreshGrid();
	refresz()
	guiSetVisible(gui['Window'], not state)
	showCursor(not state)
	
end
bindKey("F4","down",openPanel)

addEventHandler("onClientGUIClick",gui['Button_sprawdz_kod'],function()
local jezyk = getElementData(localPlayer,"Jezyk_Gry") or "PL"
	local text = guiGetText(gui['Kod_zwrotny'])
	if text == "KOD ZWROTNY" then
		if jezyk =="PL" then
			outputChatBox("* Podaj prawdziwy kod!",255,255,255)
		else
			outputChatBox("* Enter the real code!",255,255,255)
		end	
		return
	elseif text == "" then
		if jezyk =="PL" then
			outputChatBox("* Podaj prawdziwy kod!",255,255,255)
		else
			outputChatBox("* Enter the real code!",255,255,255)
		end	
	end
	triggerServerEvent("VIP_SprawdzKod",resourceRoot,text,9,localPlayer)
end,false)













