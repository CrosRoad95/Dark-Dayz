--[[txd = engineLoadTXD ("txt.txd")
engineImportTXD (txd, 1486)

dff = engineLoadDFF ("sciana.dff")
engineReplaceModel (dff, 1486)

col = engineLoadCOL( "sciana.col" )
engineReplaceCOL( col, 1486 )

engineSetModelLODDistance(1486, 350)
]]

local object = createObject(1337,-102.9375,2257.5146484375,121.6700592041)
setElementCollisionsEnabled(object,false)


function getPositionFromElementOffset(targetElement, offsetX, offsetY, offsetZ) 
    if(isElement(targetElement) == true) then 
        local theMatrix = getElementMatrix(targetElement)  -- Get the matrix 
        local posX = offsetX * theMatrix[1][1] + offsetY * theMatrix[2][1] + offsetZ * theMatrix[3][1] + theMatrix[4][1] 
        local posY = offsetX * theMatrix[1][2] + offsetY * theMatrix[2][2] + offsetZ * theMatrix[3][2] + theMatrix[4][2] 
        local posZ = offsetX * theMatrix[1][3] + offsetY * theMatrix[2][3] + offsetZ * theMatrix[3][3] + theMatrix[4][3] 
        return posX, posY, posZ 
    else 
        return false 
    end 
end 

local last_cos = nil

addEventHandler("onClientRender",root,function()
	local x,y,z = getElementPosition(localPlayer)
	--local x,y,z = getPositionFromElementOffset(localPlayer,0,5,0)
	local xr,yr,zr = getElementRotation(localPlayer);
	local offsetRot = math.rad(zr+90);
	local vx = x+5*math.cos(offsetRot);
	local vy = y+5*math.sin(offsetRot);
	outputChatBox(vy)
	if math.ceil(vy)%5 == 0 then
		setElementPosition(object,vx,vy,z)
	end
end)