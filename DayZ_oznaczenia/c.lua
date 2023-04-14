


local oznaczenia = {}
local moje_oznaczenia = {}


local sx,sy = guiGetScreenSize()


local font = dxCreateFont("font.ttf",9 * (sy/768))


function dxDrawBorderedText (outline, text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
    for oX = (outline * -1), outline do
        for oY = (outline * -1), outline do
            dxDrawText (text, left + oX, top + oY, right + oX, bottom + oY, tocolor(0, 0, 0, 255), scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
        end
    end
    dxDrawText (text, left, top, right, bottom, color, scale, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, subPixelPositioning, fRotation, fRotationCenterX, fRotationCenterY)
end

addEventHandler("onClientRender",root,function()
	for i,v in pairs(oznaczenia) do
		if getTickCount() > v[4] then
			table.remove(oznaczenia,i)
			table.remove(moje_oznaczenia,1)
		end
		local distance = getDistanceBetweenPoints3D(Vector3(getElementPosition(localPlayer)),v[1],v[2],v[3])
		if distance < 300 then
			local kordy = {getScreenFromWorldPosition( v[1],v[2],v[3] )}
			if kordy[1] and kordy[2] then
				dxDrawImage(kordy[1] - (sx * 0.03) / 2,kordy[2] - (sy * 0.05) / 2,sx * 0.03, sy * 0.05,"Oznaczenie.png")
				dxDrawBorderedText(1,math.floor(distance).."m", kordy[1] - (sx * 0.03) / 2 + sx * 0.004,kordy[2] - (sy * 0.05) / 2 - 15,sx * 0.03, sy * 0.08,tocolor(16, 124, 112,255),1,font)
			end
		end
	end
end)


function getPlayersFromGroup()
	if not getElementData(localPlayer,"Grupa") then return false end
	local osoby = {}
	for i,v in pairs(getElementsByType("player")) do
		if getElementData(localPlayer,"Grupa") and getElementData(v,"Grupa") and getElementData(localPlayer,"Grupa").nazwa == getElementData(v,"Grupa").nazwa then
			table.insert(osoby,v)
		end
	end
	return osoby
end

addEvent("PokazOznaczenie",true)
addEventHandler("PokazOznaczenie",resourceRoot,function(start)
	table.insert(oznaczenia,{start[1],start[2],start[3],getTickCount() + 15000})
end)

addEvent("PokazOznaczenieToOwner",true)
addEventHandler("PokazOznaczenieToOwner",resourceRoot,function()
	table.insert(moje_oznaczenia,true)
end)

function isPedAiming (thePedToCheck)
	if isElement(thePedToCheck) then
		if getElementType(thePedToCheck) == "player" or getElementType(thePedToCheck) == "ped" then
			if getPedTask(thePedToCheck, "secondary", 0) == "TASK_SIMPLE_USE_GUN" or isPedDoingGangDriveby(thePedToCheck) then
				return true
			end
		end
	end
	return false
end

selection = function()
	if not isPedAiming(localPlayer) then return end
	if #moje_oznaczenia <= 2 then
		local osoby = getPlayersFromGroup()
		if not osoby then return end
		local start = {getPedTargetCollision(localPlayer)}
		if not getPedTargetCollision(localPlayer) then start = {getPedTargetEnd(localPlayer)} end
		--table.insert(oznaczenia,{start.x,start.y,start.z,getTickCount() + 5000})
		--table.insert(moje_oznaczenia,true)
		triggerServerEvent("setOznaczenie",resourceRoot,osoby,start)
	end	
end
bindKey('m', 'down', selection);
addCommandHandler('oznaczanie', selection);