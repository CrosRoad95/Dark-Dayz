

addEvent("setCarHealth",true)
addEventHandler("setCarHealth",resourceRoot,function(car,dmg)
	if getElementData(car, "lista-metalu") == false then
		setElementHealth(car,getElementHealth(car) - dmg)
	else
		setElementHealth(car,getElementHealth(car) - dmg / 40)
	end
end)