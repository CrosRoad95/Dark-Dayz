
addEvent("Pomaluj",true)
addEventHandler("Pomaluj",resourceRoot,function(car,r,g,b)
	setVehicleColor(car,r,g,b)
	local x,y,z = getElementPosition(car)
	local col = createColSphere(x,y,z,30)
	local xr,yr,zr = getElementRotation(car);
	for i,v in pairs(getElementsWithinColShape(col,'player')) do
		triggerClientEvent(v,'doEffect',resourceRoot,'blood_heli',x,y,z,zr) -- blood_heli
	end
	destroyElement(col)
end)