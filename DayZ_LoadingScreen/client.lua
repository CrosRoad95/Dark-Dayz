local x, y = guiGetScreenSize()

local font = dxCreateFont("Roboto-Bold.ttf", 18.25*(x/1920), false, "cleartype")
local font2 = dxCreateFont("Roboto-Light.ttf", 14*(x/1920), false, "cleartype")

local language = "ENG"

local time = 0.05
local ImgNumber = 1
local timer, timer2
local ScreenStatus = false

local StartMessage = 
{
	["ENG"] = {
		[1] = "Welcome on DarkDayz.pl",
		[2] = "Please read a rules before you starting game. \nWe wish you a nice game! :D",
	},
	["PL"] =  {
		[1] = "Witaj na DarkDayZ.pl",
		[2] = "Przed rozpoczęciem rozgrywki zapoznaj się z zasadami. \nŻyczymy przyjemnej gry! :D",
	}
}

local topic, text, actually = false, false, 0

local TextTable = {
	["ENG"] = {
		{"Test", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test2", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test3", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test4", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test5", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test6", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
	},
	["PL"] = {
		{"Test1", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test21", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test31", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test41", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test51", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
		{"Test61", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."},
	},
}

function LoadingScreen()
	ScreenStatus = true

	timer = setTimer(function()
		ImgNumber = ImgNumber+1
		if ImgNumber == 5 then ImgNumber = 1 end
		time = 0.05

		actually = actually+1

		if actually > #TextTable[language] then actually = 1 end

		topic = TextTable[language][actually][1]
		text = TextTable[language][actually][2]

	end, 15000, 0)

	addEventHandler("onClientRender", root, dxDrawFunctions)
end

function dxDrawFunctions()
	local seconds = getTickCount() / 1000
	local angle = math.sin(seconds*2)
	local number = 175+(angle*80)

	if ImgNumber == 1 then dxDrawImage(0-time, 0-time, x+(time*2), y+(time*2), "images/5.jpg", 0, 0, 0, tocolor(255, 255, 255, 255), false) end
	if ImgNumber == 2 then dxDrawImage((0-(x/6))+time, (0-(y/6))+time, (x+(x/3))-(time*2), (y+(y/3))-(time*2), "images/2.jpg", 0, 0, 0, tocolor(255, 255, 255, 255), false) end
	if ImgNumber == 3 then dxDrawImage(0-time, 0-time, x+(time), y+(time), "images/3.jpg", 0, 0, 0, tocolor(255, 255, 255, 255), false) end
	if ImgNumber == 4 then dxDrawImage((0-(x/6))+time, (0-(y/6))+time, (x+(x/6))-time, (y+(y/6))-time, "images/4.jpg", 0, 0, 0, tocolor(255, 255, 255, 255), false) end
	if ImgNumber == 5 then dxDrawImage((0-(x/6))+time, (0-(y/6))+time, (x+(x/6))-time, (y+(y/6))-time, "images/5.jpg", 0, 0, 0, tocolor(255, 255, 255, 255), false) end

	dxDrawImage(x * 0.5131, y * 0.3267, x * 0.3912, y * 0.3478, "images/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	dxDrawImage(x * -0.1762, y * -0.0711, x * 0.5425, y * 1.0000, "images/background.png", 159, 0, 0, tocolor(124, 32, 32, 215), false)
	dxDrawImage(x * 0.1394, y * 0.2222, x * 0.0869, y * 0.1878, "images/icon.png", 0, 0, 0, tocolor(255, 255, 255, number), false)
	dxDrawText(topic or StartMessage[language][1], x * 0.0131, y * 0.4789, x * 0.3544, y * 0.5678, tocolor(255, 255, 255, 255), 1.00, font, "center", "center", false, false, false, false, false)
	dxDrawText(text or StartMessage[language][2], x * 0.0131, y * 0.5478, x * 0.3544, y * 0.7311, tocolor(255, 255, 255, 255), 1.00, font2, "center", "top", false, false, false, false, false)
		
	time = time+0.05
end

function checkingIsDownload()
	if not getElementData(localPlayer, "logedin") then
		if isTransferBoxActive() then
			if not ScreenStatus then
				showChat(false)
				LoadingScreen()
				return
			end
		elseif ScreenStatus then
			if not getResourceFromName("DayZ_LoginPanel") then return end
			removeEventHandler("onClientRender", root, dxDrawFunctions)
			exports.DayZ_LoginPanel:StartLoginPanel(language)
			time = 0.05
			killTimer(timer2)
			return
		else
			if not getResourceFromName("DayZ_LoginPanel") then return end
			exports.DayZ_LoginPanel:StartLoginPanel(language)
			killTimer(timer2)
			return
		end
	end
end


addEventHandler( "onClientResourceStart", resourceRoot, function()
	triggerServerEvent("onLoadingPanelCheckLanguage", resourceRoot, localPlayer)
	timer2 = setTimer(checkingIsDownload, 2000, 0)
end);


addEvent( "onServerCheckedLanguage", true )
addEventHandler( "onServerCheckedLanguage", localPlayer, function(lang)
	language = lang
end)	