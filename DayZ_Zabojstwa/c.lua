
sx,sy = guiGetScreenSize()

scale = 1

if sx > 768 then
    scale = sx/768
end

local font = guiCreateFont( "Font.ttf", 8*scale )

local elements_gui = {}

elements_gui['image'] = guiCreateStaticImage(0.34, 0.01, 0.31, 0.05,'KillInfo.png', true)
guiSetAlpha(elements_gui['image'],0.8)
elements_gui['text'] = guiCreateLabel(0.34, 0.01, 0.31, 0.05, "You Killed SoczekPizdaiCwel", true)
guiLabelSetHorizontalAlign(elements_gui['text'],'center')
guiLabelSetVerticalAlign(elements_gui['text'],'center')
guiSetFont(elements_gui['text'],font)    


guiSetVisible(elements_gui['image'],false)
guiSetVisible(elements_gui['text'],false)

local zanikanie_timer

local language = {
	['PL'] = {
		['Zabiles'] = "Zabiles ",
	},
	['ENG'] = {
		['Zabiles'] = "You Killed "
	},
}

function zanikanie()
	local _21=0
	for i,v in pairs(elements_gui) do
		if not guiGetVisible(elements_gui[i]) then
			_21 = _21 + 1
		end
	end
	if _21==2 then
		killTimer(zanikanie_timer)
		return
	end
	local visible = {}
	visible.text = guiGetAlpha(elements_gui['text'])
	visible.image = guiGetAlpha(elements_gui['image'])
	for i,v in pairs(visible) do
		if v<0.01 then
			guiSetVisible(elements_gui[i],false)
		else
			guiSetAlpha(elements_gui[i],v-0.01)
		end
	end
end


function showKillInfo(death)
	guiBringToFront(elements_gui['text'])
	guiSetAlpha(elements_gui['image'],0.8)
	guiSetAlpha(elements_gui['text'],1)
	local jezyk = getElementData(localPlayer,'Jezyk_Gry') or "PL"
	guiSetText(elements_gui['text'],language[jezyk]['Zabiles']..death:gsub("#%x%x%x%x%x%x",""))
	for k,v in pairs(elements_gui) do
		guiSetVisible(elements_gui[k],true)
	end
end

	
	

	
addEvent("ShowKill",true)
addEventHandler('ShowKill',resourceRoot,function(death)
	showKillInfo(death)
	playSound('kill.wav')
	if not isTimer(zanikanie_timer) then
		zanikanie_timer = setTimer(zanikanie,50,0)
	end
end)
