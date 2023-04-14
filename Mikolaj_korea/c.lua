

txd = engineLoadTXD ( "model/tree.txd" )
engineImportTXD ( txd, 2754 )
dff = engineLoadDFF ( "model/tree.dff" )
engineReplaceModel ( dff, 2754 )
txd = engineLoadTXD ( "model/present.txd" )
engineImportTXD ( txd, 1275 )
dff = engineLoadDFF ( "model/present.dff" )
engineReplaceModel ( dff, 1275 )
txd = engineLoadTXD ( "model/santa.txd" )
engineImportTXD ( txd, 300 )
dff = engineLoadDFF ( "model/santa.dff" )
engineReplaceModel ( dff, 300 )

 
local texture = dxCreateTexture("i/icon.png")
 
local fx = dxCreateShader("fx/shader.fx")
if fx then
	dxSetShaderValue(fx, "tex", texture)
	engineApplyShaderToWorldTexture(fx, "radar_bulldozer")
end

local blip = exports.DayZ_customBlips:createCustomBlip ( 2490.9670410156, -1666.9992675781, 32, 32, "i/icon.png" )

addEventHandler("onClientRender",root,function()
	for i,v in pairs(getElementsByType("blip",resourceRoot)) do
		if isPlayerMapVisible() then
			setBlipIcon(v,0)
			setBlipSize(v,0)
		else
			setBlipIcon(v,11)
		end
	end
end)

local messages = {}

addEventHandler("onClientRender", root, function()
	local x, y, z = getElementPosition(getElementsByType("ped", resourceRoot)[1])
	local dist = getDistanceBetweenPoints3D(x, y, z ,Vector3(getElementPosition(localPlayer)))
	if dist > 30 then return end
	local coords = { getScreenFromWorldPosition(x, y, z + 1) }
	if coords[1] and coords[2] then
		local w = dxGetTextWidth("#d63838[!] #ffffffPapa #ffbc63Joker #d63838[!]", 1, "default-bold", true)
		dxDrawText ( "#d63838[!] #ffffffPapa #ffbc63Joker #d63838[!]", coords[1] - w / 2+0.3, coords[2], coords[1]+0.3, coords[2], tocolor(255,255,255, 180 + math.abs(math.sin(getTickCount()))*40), 1, "default-bold", "left", "top", false, false,false, true)
	end
	for i, v in pairs(messages) do
		local alpha = interpolateBetween(150, 0, 0, 0, 0, 0, (getTickCount() - v[2]) / 4500, "Linear")
		if alpha < 1 then
			table.remove(messages, i)
			return
		end
		local _z = (150 - alpha) * 0.005
		local coords = { getScreenFromWorldPosition(x, y, z + 1.1 + _z) }
		if coords[1] and coords[2] then
			local w = dxGetTextWidth(v[1], 1, "default-bold")
			dxDrawText ( v[1], coords[1] - w / 2, coords[2], coords[1], coords[2], tocolor(255,255,255, alpha), 1, "default-bold" )
		end
	end
end)


local mess = {
	"Administracja Dark DayZ życzy miłego pobytu na serwerze!",
	"Święta idą święta Twoja stara robi pompki na piętach",
	"Widze że jesteś słabym graczem, spróbuj szczęścia u mnie!",
	"Napierdalaj śnieżkami bałwanów z family content!",
}

setTimer(function()
	local los = mess[math.random(#mess)]
	table.insert(messages, {los, getTickCount()})
end, 10000, 0)


addEventHandler("onClientColShapeHit", resourceRoot, function(el)
	if el == localPlayer then
		startSnow()
		setElementData(localPlayer, "GodMode", true)
	end
end)

addEventHandler("onClientColShapeLeave", resourceRoot, function(el)
	if el == localPlayer then
		stopSnow()
		setElementData(localPlayer, "GodMode", false)
	end
end)


