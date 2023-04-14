

local pozycja

function renderCos()
	if not pozycja then return end
	local x,y,z = unpack(pozycja)
	z = z - 1
	for i=1,10 do
		dxDrawLine3D(x+1,y,z + i * 0.2,x,y+1,z + i * 0.2,tocolor(255,0,0,255),1.5)
		dxDrawLine3D(x-1,y,z + i * 0.2,x,y-1,z + i * 0.2,tocolor(255,0,0,255),1.5)
		dxDrawLine3D(x,y+1,z + i * 0.2,x-1,y,z + i * 0.2,tocolor(255,0,0,255),1.5)
		dxDrawLine3D(x,y-1,z + i * 0.2,x+1,y,z + i * 0.2,tocolor(255,0,0,255),1.5)
	end
	dxDrawLine3D(x,y + 1,z + 10 * 0.2,x,y - 1,z + 10 * 0.2,tocolor(255,0,0,255),1.5)
	dxDrawLine3D(x + 1,y,z + 10 * 0.2,x - 1,y,z + 10 * 0.2,tocolor(255,0,0,255),1.5)
end

addEvent("renderFirst",true)
addEventHandler("renderFirst",resourceRoot,function(poz)
	pozycja = poz
	addEventHandler("onClientRender",root,renderCos)
end)

addEvent("renderEnd",true)
addEventHandler("renderEnd",resourceRoot,function()
	pozycja = nil
	removeEventHandler("onClientRender",root,renderCos)
end)