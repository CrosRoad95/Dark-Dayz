
function dxDrawTextOnElement(x,y,z,text,height,distance,R,G,B,alpha,size,font,...)
	local x2, y2, z2 = getCameraMatrix()
	local distance = distance or 30
	local height = height or 2

--	if (isLineOfSightClear(x, y, z+2, x2, y2, z2, ...)) then
		local sx, sy = getScreenFromWorldPosition(x, y, z+height)
		if(sx) and (sy) then
			local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
			if(distanceBetweenPoints < distance) then
				dxDrawText(text, sx+2, sy+2, sx, sy, tocolor(R or 255, G or 0, B or 0, alpha or 255),1, font or "arial", "center", "center")
			end
		end
	--end
end


local konteners = {}

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end


function formatTime(value)
	if value then
		local hours = math.floor(value/60)
		local minutes = math.round(((value/60) - math.floor(value/60))*100/(100/60))
		if minutes < 10 then minutes = "0"..minutes end
		value = hours..":"..minutes
		return value
	end
	return false
end

function addNewKontenerText(x,y,z,obj,tick)
	if konteners[obj] then return end
	konteners[obj] = {x,y,z,tick}
end
addEvent('boat_addKontener',true) 
addEventHandler('boat_addKontener', resourceRoot, addNewKontenerText)

function deleteAllKonteners()
	konteners = {}
end

function deleteKontener(obj)
	konteners[obj] = nil
end

addEventHandler("onClientRender", getRootElement(), 
function ()
	for i,v in pairs(konteners) do
		--if getTickCount()-tick>1000 then
			
		--end
		local minuty1 = v[4]
		local minuty2 = getElementData(resourceRoot,"Konteners")
		local minutes = ( minuty1 - minuty2) / 60000
		local time = formatTime(minutes)
		-- math.ceil(()/60000)
		dxDrawTextOnElement(v[1],v[2],v[3], time.."h do otwarcia\nNa serwerze musi być 5'ciu graczy.",1,20,255,0,0,255,3,"bankgothic")
		
	end
end)

addEvent('deleteKontener',true)

addEvent('deleteAllKontener',true)
addEventHandler('deleteKontener',resourceRoot,deleteKontener)

addEventHandler('deleteAllKontener',resourceRoot,deleteAllKonteners)



