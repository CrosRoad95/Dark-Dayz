
local wiklolowatych

addEvent("setStreamble",true)
addEventHandler("setStreamble",resourceRoot,function(obj,trasa)
	setElementStreamable(obj,false)
	wiklolowatych = obj
	setTrainPosition(obj,trasa)
	setTimer(wyslijPozycje,3000,0,obj)
end)

function wyslijPozycje(source)
	local x,y,z = getElementPosition(source)
	triggerServerEvent("sendPosition",resourceRoot,getTrainPosition(source),{x,y,z})
end

addEvent("setTrainPos",true)
addEventHandler("setTrainPos",resourceRoot,function(trasa)
	local trasa_my = getTrainPosition(wiklolowatych)
	if math.abs(trasa_my - trasa) > 10 then
		setTrainPosition(wiklolowatych,trasa)
	end
end)