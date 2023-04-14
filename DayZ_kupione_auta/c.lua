addEvent("onRemovalBlipRequest", true)

local blips = {}

function setBoughtVehiclesBlips()

    if not getElementData(localPlayer, "logedin") then return end

    setTimer(function()

        for k, veh in pairs(getElementsByType("vehicle")) do
            local base_id = getElementData(veh,"base_id");
            if base_id then
                if exports.DayZ_Automatic_base:isPlayerInBase(localPlayer, base_id) then
                    local id = getElementData(veh, "Auto-ID")
                    blips[id] = createBlipAttachedTo(veh, 0)
                end
            end
        end
        
    end, 150, 1)
end

function destroyBlip(id)
    if blips[id] then destroyElement(blips[id]) end
end

addEventHandler( "onPlayerDayZLogin", root, setBoughtVehiclesBlips)
addEventHandler( "onClientResourceStart", root, setBoughtVehiclesBlips)
addEventHandler( "onRemovalBlipRequest", root, destroyBlip)