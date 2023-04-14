function paintjob (plr)
        local vehicle = getPedOccupiedVehicle(plr)
        local modelID = getElementModel(vehicle)
        if (vehicle) then
        local tuning_paintjob = getElementData(vehicle, "tuning.paintjob")
            if (tuning_paintjob == true) then 
            outputChatBox( "Pojazd już posiada PaintJoba!", plr)
            else
                triggerClientEvent(root, 'nadaj:PaintJob', root, vehicle)
                setElementData(vehicle, 'tuning.paintjob', true)
            end
        end
    end
addCommandHandler('pj', paintjob)

function adminpj (plr)
        local vehicle = getPedOccupiedVehicle(plr)
        local modelID = getElementModel(vehicle)
        if (vehicle) then
        local tuning_paintjob = getElementData(vehicle, "pja")
            if (tuning_paintjob == true) then 
            outputChatBox( "Pojazd już posiada PaintJoba!", plr)
            else
                triggerClientEvent(root, 'pja', root, vehicle)
                setElementData(vehicle, 'pja', true)
            end
        end
    end
addCommandHandler('pja', adminpj)

function loadpj()
	for i, v in pairs(getElementsByType("vehicle", resourceRoot)) do
		if getElementData(v, "Auto-ID") == 15075 then
			triggerClientEvent(root, 'pja', root, vehicle)
		end
	end
end