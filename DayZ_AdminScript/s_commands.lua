local TrueFalseTable = {
    [true] = "#32c732ON",
    [false] = "#c73e32OFF",
}

-----------------------------------------------------
--------------------[ Permisions ]-------------------
-----------------------------------------------------

local ranks = {"Console", "Admin", "Vice Admin", "Pomocnik", "Pomocnik2", "Moderator2", "ModChat"}
local createVehicleForPlayerPermisions = {"Console", "Admin"}
local DestroyCarPermisions = {"Console", "Admin"}
local fixCarPermisions = {"Console", "Admin"}
local GodCarPermisions = {"Console", "Admin"}
local flipCarPermisions = {"Console", "Admin"}
local ClearChatPermisions= {"Console", "Admin"}
local FlyingPermisions= {"Console", "Admin"}
local hidePlayerPermisions= {"Console", "Admin"}
local ClearDebugScriptPermisions= {"Console", "Admin"}
local setelementPermisions= {"Console", "Admin"}
local getelementPermisions= {"Console", "Admin"}
local devmodePermisions= {"Console", "Admin"}
local getRotationPermisions= {"Console", "Admin"}
local addPointsPermisions= {"Console", "Admin"}
local removePointsPermisions= {"Console", "Admin"}
local addMoneyPermisions= {"Console", "Admin"}
local removeMoneyPermisions= {"Console", "Admin"}
local giveItemPermisions= {"Console", "Admin"}
local godFunctionPermisions= {"Console", "Admin"}
local teleportToPlayerPermisions= {"Console", "Admin"}
local teleportToHerePermisions= {"Console", "Admin"}
local teleportToLocationPermisions= {"Console", "Admin"}
local teleportBackPermisions= {"Console", "Admin"}
local teleportToBasePermisions= {"Console", "Admin"}
local checkDutyPermisions= {"Console", "Admin", "Moderator2", "ModChat"}
local warnFunctionPermisions = {"Console", "Admin", "Moderator2", "ModChat"}
local SpectatePermisions= {"Console", "Admin"}
local adminRoomFunctionPermisions= {"Console", "Admin"}
local suszarkaPermisions= {"Console", "Admin"}
local commandHelp= {"Admin"}

-----------------------------------------------------
--------------------[ Functions ]--------------------
-----------------------------------------------------


function setDuty(player)
    local status = getElementData(player, "duty")
    local acc_name = getAccountName(getPlayerAccount(player))

    for k, v in pairs(ranks) do
        if isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            if status then
                setElementData(player, "duty", false)
                outputChatBox("#c22d2d[#b75656✖#c22d2d]#FFFFFF Wylogowałeś się z duty - "..exports.DayZ_ranks:getRankFullName(v, "PL", 2), player, 255, 255, 255, true)
                if v == "Console" or v == "Admin" then
                    setElementModel(player, getElementData(player, "admin_skin") or 73)
                    setElementData(player,'Administrator-Open',false)
                    setElementData(player,'God',false)
                end
                return 
            else
                setElementData(player, "duty", v)
                outputChatBox("#c22d2d[#56b769✔#c22d2d]#FFFFFF Zalogowałeś się na duty - "..exports.DayZ_ranks:getRankFullName(v, "PL", 2), player, 255, 255, 255, true)
                if v == "Console" or v == "Admin" then
                    setElementData(player,'admin_skin',getElementModel(player))
                    setElementData(player, "MAX_Slots", 3000)
                    setElementModel(player, 217)
                    setElementData(player,'Administrator-Open',true)
                    setElementData(player,'God',true)
                end
                return
            end
        end
    end
end

-----------------------------------------------------

function adminChat(plr, cmd, ...)
    local acc_name = getAccountName(getPlayerAccount(plr))

    for k, v in pairs(ranks) do
        if isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            local mess = table.concat ( { ... }, " " )
            if (mess == "") or (mess == " ") or not mess then TryAgainCommand(plr, "ac", {"treść"}) return end
            --if ( isPlayerOnGroup ( plr ) ) then
                for _, player in ipairs ( getElementsByType ( "player" ) ) do
                    if ( isPlayerOnGroup ( player ) ) then
                         playSoundFrontEnd(player, 20)
                         outputChatBox ( "#c22d2dAC#6b6b6b >> #FFFFFF"..id(plr).." "..exports.DayZ_ranks:getRankFullName(v, "PL", 3).."#ffffff "..getPlayerName(plr)..": #9c9c9c"..mess, player, 255, 255, 255, true )
                    end
                end
            --end
            return
        end
    end
end

function isPlayerOnGroup ( thePlayer )
    local acc_name = getAccountName(getPlayerAccount(thePlayer))
    local inGroup = false
    for k, v in pairs(ranks) do
        if isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            inGroup = true
        end
    end
 
    return inGroup
end

-----------------------------------------------------

function createVehicleForPlayer(player, cmd, ...)
    local status = getElementData(player, "duty")
    local acc_name = getAccountName(getPlayerAccount(player))

    for k, v in pairs(createVehicleForPlayerPermisions) do
        if status and isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            local veh = table.concat ( { ... }, "" )

            if veh == "" or not veh then TryAgainCommand(player, "cv", {"id pojazdu lub model"}) return end

            if (tonumber(veh) or 0) >= 400 and (tonumber(veh) or 0) <= 611 then
                createvehicle(player, tonumber(veh))
            elseif getVehicleModelFromName((tostring(veh) or "")) then
                createvehicle(player, getVehicleModelFromName((tostring(veh))))
            else
                outputChatBox("#d63838[!] #ffffffNie ma pojazdu o takim id lub nazwie.", player, 255, 255, 255, true)
            end
           return
        end
       
    end
end

function createvehicle(player, model)
    local Tires,Engine,parts,slots = exports.DayZ_vehicle:getVehicleAddonInfos(model)
    if not Tires then outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffSerwer nie obsługuje tego pojazdu.", player, 255, 255, 255, true) return end
    local x,y,z = getElementPosition(player)
    local veh = createVehicle(model, x+2, y+2.5, z+0.5);
    local vehCol = createColSphere(x+2, y+2.5, z+0.5, 2.5);
    attachElements(vehCol, veh);
    setElementData(vehCol, "parent", veh);
    setElementData(veh, "parent", vehCol);
    setElementData(vehCol, "vehicle", true);
    setElementData(vehCol, "MAX_Slots", tonumber(slots));
    setElementData(vehCol, "Tire_inVehicle", Tires);
    setElementData(vehCol, "Engine_inVehicle", tonumber(Engine));
    setElementData(vehCol, "Parts_inVehicle", tonumber(parts));
    setElementData(vehCol, "fuel", 20);

    outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffStworzyłeś pojazd #9c9c9c"..getVehicleName(veh), player, 255, 255, 255, true)
end

-----------------------------------------------------

function DestroyCar(player)
    local status = getElementData(player, "duty")
    local acc_name = getAccountName(getPlayerAccount(player))

    for k, v in pairs(DestroyCarPermisions) do
        if status and isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            if not getPedOccupiedVehicle(player) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffMusisz być w pojeździe!",player, 255, 255, 255, true) return end
            local vehicle = getPedOccupiedVehicle(player)
            local col = getElementData(vehicle, "parent")
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d] Usunąłeś pojazd #9c9c9c"..getVehicleName(vehicle),player, 255, 255, 255, true)
            destroyElement(col)
            destroyElement(vehicle)
            return 
        end
    end
end

-----------------------------------------------------

function fixCar(player)
    local status = getElementData(player, "duty")
    local acc_name = getAccountName(getPlayerAccount(player))

    for k, v in pairs(fixCarPermisions) do
        if status and isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            if not getPedOccupiedVehicle(player) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffMusisz być w pojeździe!",player, 255, 255, 255, true) return end
            local vehicle = getPedOccupiedVehicle(player)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffff Naprawiłeś pojazd #9c9c9c"..getVehicleName(vehicle),player, 255, 255, 255, true)
            fixVehicle(vehicle)
            return
        end
    end
end

--------------------------------------------------------------

function GodCar(player)
    local status = getElementData(player, "duty")
    local acc_name = getAccountName(getPlayerAccount(player))

    for k, v in pairs(GodCarPermisions) do
        if status and isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            if not getPedOccupiedVehicle(player) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffMusisz być w pojeździe!",player, 255, 255, 255, true) return end
            local vehicle = getPedOccupiedVehicle(player)
            local god_status = getElementData(vehicle, "v_god")
            if god_status then
                setElementData(vehicle,"v_god", false)
                setVehicleDamageProof(vehicle, false)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffZ pojazd #9c9c9c"..getVehicleName(vehicle).."#ffffff god został usunięty.",player, 255, 255, 255, true)
            else
                setElementData(vehicle,"v_god", true)
                setVehicleDamageProof(vehicle, true)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffPojazd #9c9c9c"..getVehicleName(vehicle).."#ffffff otrzymał goda.",player, 255, 255, 255, true)
            end 
            return
        end
        
    end
end

-----------------------------------------------------

function flipCar(player)
    local status = getElementData(player, "duty")
    local acc_name = getAccountName(getPlayerAccount(player))

    for k, v in pairs(flipCarPermisions) do
        if status and isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            if not getPedOccupiedVehicle(player) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffMusisz być w pojeździe!",player, 255, 255, 255, true) return end
            local vehicle = getPedOccupiedVehicle(player)
            local x, y, z = getElementPosition(vehicle)
            local rx, ry, rz = getElementRotation(vehicle)
            setElementRotation(vehicle, 0, 0, rz)
            setElementPosition(vehicle, x, y, z+1)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffFlipnąłes pojazd #9c9c9c"..getVehicleName(vehicle),player, 255, 255, 255, true)
        end
     end
      return
end

--------------------------------------------------------------

function Flying(player)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(FlyingPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local status = not getElementData(player,"Ryjek")
            setElementData(player,"Ryjek", status)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Status latania - "..TrueFalseTable[status],player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------

function hidePlayer(player)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(hidePlayerPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local itm = {}
            for i=1,4 do
                if (i ~= 3) then
                    itm[i] = getElementData(player, "tohide"..i)
                end
            end

            local status = not getElementData(player, "hidestatus")
            local alpha = {[true] = 255, [false] = 0}

            setElementData(player,"hidestatus",status)
            setElementAlpha(player, alpha[status])
            for i=1,4 do
                if (i ~= 3) then
                    if (itm[i] and itm[i]~="NONE") then setElementAlpha(itm[i], alpha[status]) end
                end
            end
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Niewidzialność - "..TrueFalseTable[status],player, 255, 255, 255, true)

            return
        end
    end
end

-----------------------------------------------------

function ClearChat(player)
    local status = getElementData(player, "duty")
    local acc_name = getAccountName(getPlayerAccount(player))

    for k, v in pairs(ClearChatPermisions) do
        if status and isObjectInACLGroup ("user."..acc_name, aclGetGroup (v)) then
            for g, c in pairs(getElementsByType("player")) do
                local lang = (getElementData(c, "Jezyk_Gry") or "ENG")
                clearChatBox(c)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff ".. getTextLang(lang, "clear_chat").." - "..id(player).." "..exports.DayZ_ranks:getRankFullName(v, lang, 3).." #ffffff".. getPlayerName(player).."#ffffff!",c, 255, 255, 255, true)
 
            end 
              return 
        end    
    end
end

--------------------------------------------------------------

function ClearDebugScript(player, cmd)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(ClearDebugScriptPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            print("---------------------------------------------------") 
        end
    end
end

--------------------------------------------------------------

function setelement(player, cmd, arg1, nick2, element, value)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(setelementPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not arg1 or not nick2 or not element then
                TryAgainCommand(player, "se", {"1 lub 2", "nick", "element", "wartość"})
                return
            end

            if tonumber(arg1) == 1 then
                value = tonumber(value)
            end
                
            local nick = getPlayerFromName(nick2)
            element = ""..element..""
            setElementData(nick, element, value)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Wartość została zmieniona!",player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------

function getelement(player, cmd, nick2, element)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(getelementPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not nick2 or not element then
                TryAgainCommand(player, "ge", {"nick", "element"})
                return
            end

            local nick = getPlayerFromName(nick2)
            element = ""..element..""
            local element2 = getElementData(nick, element)

            if not nick then
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Te konto nie istnieje.",player, 255, 255, 255, true)
            elseif not element2 then
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Ta Data nie istnieje lub jest równa 0.",player, 255, 255, 255, true)
            elseif nick and element2 then
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Wartość jest równa: "..tostring(element2),player, 255, 255, 255, true)
            end     
        end
    end
end

--------------------------------------------------------------

function devmode(player)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(devmodePermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            triggerClientEvent("devMode", player)
        end
    end
end

--------------------------------------------------------------

function getRotation(player)
    for k, v in pairs(getRotationPermisions) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local x, y, z = getElementRotation(player)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Rotacja: "..string.format("%.02f",x)..", "..string.format("%.02f",y)..", "..string.format("%.02f",z),player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------

function addPoints(player, cmd, cat, cat_c, nick, value)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(addPointsPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not cat or not nick or not value or (not(cat_c=="GP" or cat_c=="PP")) then
                TryAgainCommand(player, "ap", {"offline/online", "GP/PP", "nick/id", "ilość"})
                return
            end

            value = math.floor(tonumber(value))

            if cat == "offline" then
                local acc = getAccount(nick) if not acc then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Podane konto nie istnieje!",player, 255, 255, 255, true) return end
                if getAccountPlayer(acc) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie możesz dodawać "..cat_c.." osobie, która jest #56b769online#ffffff poprzez tryb dodawania #7c2020offline#ffffff!",player, 255, 255, 255, true) return end
                
                local p = getAccountData(acc, cat_c) or 0
                setAccountData(acc, cat_c, p + value)

                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Dodałeś #9c9c9c"..value..cat_c.."#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość "..cat_c.." wynosi: #9c9c9c"..(p+value),player, 255, 255, 255, true)
            elseif cat == "online" then
                local plr = getDarkDayZPlayer(nick) if not plr then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true) return end
                
                local SenderNick = getPlayerName(player)
                local nick = getPlayerName(plr)
                
                local p = getElementData(plr, cat_c) or 0
                setElementData(plr, cat_c, p + value)

                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Dodałeś #9c9c9c"..value..cat_c.."#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość "..cat_c.." wynosi: #9c9c9c"..(p+value),player, 255, 255, 255, true)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff "..getTextLang(getElementData(plr, "Jezyk_Gry"), "you_received").." #9c9c9c"..value..cat_c.."#ffffff "..getTextLang(getElementData(plr, "Jezyk_Gry"), "from").." "..SenderNick.."!",plr, 255, 255, 255, true)
            end

        end
    end
end

--------------------------------------------------------------

function removePoints(player, cmd, cat, cat_c, nick, value)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(removePointsPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not cat or not nick or not value or (not(cat_c=="GP" or cat_c=="PP")) then
                TryAgainCommand(player, "rp", {"offline/online", "GP/PP", "nick/id", "ilość"})
                return
            end

            value = math.floor(tonumber(value))

            if cat == "offline" then
                local acc = getAccount(nick) if not acc then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Podane konto nie istnieje!",player, 255, 255, 255, true) return end
                if getAccountPlayer(acc) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie możesz dodawać "..cat_c.." osobie, która jest #56b769online#ffffff poprzez tryb dodawania #7c2020offline#ffffff!",player, 255, 255, 255, true) return end
                
                local p = getAccountData(acc, cat_c) or 0
                if (p-value) <= 0 then setAccountData(acc, cat_c, 0)
                else setAccountData(acc, cat_c, p - value) end

                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Odjąłeś #9c9c9c"..value..cat_c.."#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość "..cat_c.." wynosi: #9c9c9c"..(getAccountData(acc, cat_c) or 0),player, 255, 255, 255, true)
            elseif cat == "online" then
                local plr = getDarkDayZPlayer(nick) if not plr then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true) return end
                
                local SenderNick = getPlayerName(player)
                local nick = getPlayerName(plr)
                
                local p = getElementData(plr, cat_c) or 0
                if (p-value) <= 0 then setElementData(plr, cat_c, 0)
                else setElementData(plr, cat_c, p - value) end

                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Odjąłeś #9c9c9c"..value..cat_c.."#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość "..cat_c.." wynosi: #9c9c9c"..(getElementData(plr, cat_c) or 0),player, 255, 255, 255, true)
                if getElementData(plr, "Jezyk_Gry") == "PL" then
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff "..exports.DayZ_ranks:getRankFullName(v, "PL", 3).."#ffffff "..getPlayerName(player).." odojął ci "..value..cat_c.."!",plr, 255, 255, 255, true)
                else
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff "..exports.DayZ_ranks:getRankFullName(v, "ENG", 3).."#ffffff "..getPlayerName(player).." took "..value..cat_c.." from you",plr, 255, 255, 255, true)
                end
            end

        end
    end
end

--------------------------------------------------------------

function giveItem(player, cmd, nick, value, ...)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(giveItemPermisions) do
        local item = table.concat ( { ... }, " " )
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not nick or not item or not value then
                TryAgainCommand(player, "gi", {"nick lub id", "ilość", "przedmiot"})
                return
            end

            local plr = getDarkDayZPlayer(nick) if not plr then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true) return end

            local item2 = getElementData(plr, item) if not item2 then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Taki przedmiot może nie istnieć!",player, 255, 255, 255, true) return end
            local SenderNick = getPlayerName(player)
            setElementData(plr, item, item2 + tonumber(value))
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Dodałeś #9c9c9c"..value.." "..item.."#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff "..getTextLang(getElementData(player, "Jezyk_Gry"), "you_received").." #9c9c9c"..value.." "..item.."#ffffff "..getTextLang(getElementData(player, "Jezyk_Gry"), "from").." #9c9c9c"..SenderNick.."#ffffff.",player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------

function godFunction(player)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(godFunctionPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local status = not getElementData(player,"god")
            setElementData(player,"god", status)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF GodMode - "..TrueFalseTable[status],player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------

function teleportToPlayer(player, cmd, nick)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(teleportToPlayerPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            
            if not nick then
                TryAgainCommand(player, "tp", {"nick lub id"})
                return
            end

            local plr = getDarkDayZPlayer(nick) if not plr then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true) return end
            if plr == player then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie możesz sam się do siebie teleportować!",player, 255, 255, 255, true) return end
            
            local x, y, z = getElementPosition(plr)
            setElementPosition(player, x+1, y+2, z)

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Przeniesiono do gracza #9c9c9c"..getPlayerName(plr),player, 255, 255, 255, true)
            if getElementData(plr, "duty") == "Admin" or getElementData(plr, "duty") == "Console" then
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Administrator #9c9c9c"..getPlayerName(player).."#ffffff przeteleportował się do ciebie",plr, 255, 255, 255, true)
            end
        end
    end
end

--------------------------------------------------------------


function teleportToHere(player, cmd, nick)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(teleportToHerePermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            
            if not nick then
                TryAgainCommand(player, "tph", {"nick lub id"})
                return
            end

            local plr = getDarkDayZPlayer(nick) if not plr then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true) return end
            if plr == player then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie możesz sam się do siebie teleportować!",player, 255, 255, 255, true) return end
            
            local x, y, z = getElementPosition(player)
            setElementPosition(plr, x+1, y+2, z)

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Przeniesiono do ciebie gracza #9c9c9c"..getPlayerName(plr),player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Administrator #9c9c9c"..getPlayerName(player).."#ffffff przeteleportował cię do siebie",plr, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function teleportToLocation(player, cmd, x, y, z)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(teleportToLocationPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            
            if not x or not y or not z then
                TryAgainCommand(player, "tpj", {"x", "y", "z"})
                return
            end

            local lx, ly, lz = getElementPosition(player)
            setElementData(player, "last_xyz", {lx, ly, lz})

            x, y, z = tonumber(x), tonumber(y), tonumber(z)

            setElementPosition(player, x, y, z)

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Przeniesiono na #9c9c9c"..x..", "..y..", "..z,player, 255, 255, 255, true)

        end
    end
end

--------------------------------------------------------------

function teleportBack(player)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(teleportBackPermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            local xyz = getElementData(player, "last_xyz")
            if not xyz then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie posiadasz zapisanej ostatniej lokacji.", player, 255, 255, 255, true) return end

            setElementPosition(player, xyz[1], xyz[2], xyz[3])

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Przeniesiono na #9c9c9c"..xyz[1]..", "..xyz[2]..", "..xyz[3],player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function teleportToBase(player, cmd, id)
    local duty = getElementData(player, "duty")
    local Name = getAccountName (getPlayerAccount(player))

    for k, v in pairs(teleportToBasePermisions) do
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            if not id then
                TryAgainCommand(player, "tpba", {"id_bazy"})
                return
            end

            for k, v in pairs(getElementsByType("marker")) do
                if getElementData(v, "base_id") and getElementData(v, "base_id") == id then
                    local lx, ly, lz = getElementPosition(player)
                    setElementData(player, "last_xyz", {lx, ly, lz})

                    local x, y, z = getElementPosition(v)
                    setElementPosition(player, x, y, z+2)

                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Przeniesiono pod baze: #9c9c9c"..id,player, 255, 255, 255, true)
                    return
                end
            end

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono bazy o id: #9c9c9c"..id,player, 255, 255, 255, true)
        end 
    end
 return 
end


--------------------------------------------------------------


function checkDuty(player)
    for k, v in pairs(checkDutyPermisions) do
        local Name = getAccountName (getPlayerAccount(player))
        if isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff ------ Lista czasu duty ------",player, 255, 255, 255, true)

            for k, v in pairs(getAccounts()) do
                if getAccountData(v, "dutyTime") then
                    local accName = getAccountName(v)
                    if getAccountPlayer(v) then
                        outputChatBox("#9c9c9c"..accName.."#ffffff - "..(getAccountData(v, "dutyTime") or 0).."min",player, 255, 255, 255, true)
                    end
                end
            end

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff ---------------------------------------------------------",player, 255, 255, 255, true)
            return
        end
    end
end

--------------------------------------------------------------


function warnFunction(player, cmd, nick, ...)
    for k, v in pairs(warnFunctionPermisions) do
        local Name = getAccountName (getPlayerAccount(player))
        if isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            
            if not player or not nick or not { ... } then
                TryAgainCommand(player, "warn", {"nick lub id", "powód"})
                return
            end

            local plr

            local plr = getDarkDayZPlayer(nick) if not plr then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true) return end
            if plr == player then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie możesz sam się do siebie zwarnować!",player, 255, 255, 255, true) return end

            local message = table.concat ( { ... }, " " )

            if not PermisionRankCheck(player, plr) then
                outputChatBox ( "#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie posiadasz permisji, aby wykonać operację na tej osobie. #9c9c9c"..getPlayerName(plr).."#ffffff dostał informacje o twojej próbie wykonania operacji.", player, 255, 100, 70, true )
                outputChatBox ( "#c22d2d[#6b6b6b!#c22d2d]#ffffff Administrator #9c9c9c"..getPlayerName(player).."#ffffff usiłował wykonac na tobie operację: #9c9c9cwarn #ffffff- "..message, plr, 255, 100, 70, true )
                return
            end


            local warn = getElementData(plr, "warn") or 0
            setElementData(plr, "warn", warn+1)
            if (getElementData(plr, "warn") or 0) > 2 then 
                setTimer ( outputConsole, 99, 1, "\n\n\n\n\n\n\n\n--------------------------------------\n dark-dayz.pl\n\nOtrzymałeś kicka od "..getPlayerName(player).."\nPowód: 3/3 ostrzeżeń\nTreść ostatniego ostrzeżenia: "..message.."\n--------------------------------------", plr )
                setTimer ( kickPlayer, 100, 1, plr, player, "Sprawdź konsolę" )
            end

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Zwarowałeś #9c9c9c"..getPlayerName(plr).."#ffffff! Ilość posiadanych warnów: #9c9c9c"..getElementData(plr, "warn").."#ffffff, Powód: #9c9c9c"..message,player, 255, 255, 255, true)
            exports.DayZ_Notification:DrawNotification("#ff4040Ostrzeżenie("..(getElementData(plr, "warn") or 0).."/3) od #ffffff"..getPlayerName(player).."#ffffff\nPowód: "..message, 255, 255, 255, plr, 3)
            return
        end
    end
end

--------------------------------------------------------------


function spectateFunction(player, cmd, nick)
    for k, v in pairs(SpectatePermisions) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            local spectate = getElementData(player, "spectate")

            if not spectate then

                if not id then
                    TryAgainCommand(player, "spec", {"nick lub id"})
                    return
                end
           
                local plr = getDarkDayZPlayer(nick) if not plr then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true) return end
                if plr == player then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff Nie możesz sam się do siebie teleportować!",player, 255, 255, 255, true) return end

                triggerClientEvent("onAdminStartSpectating", player, player, plr)
            else
                triggerClientEvent("onAdminStartSpectating", player, player)
            end

            return         
        end
    end
end

--------------------------------------------------------------

function adminRoomFunction(player)
    local Name = getAccountName (getPlayerAccount(player))
    local duty = getElementData(player, "duty")

    for k, v in pairs(adminRoomFunctionPermisions) do
        if duty and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            triggerClientEvent("onPlayerUseAdminRoom", player, player)
            return
        end
    end
end

--------------------------------------------------------------

function suszarkaFunction(player) -- by Korea
    local Name = getAccountName (getPlayerAccount(player))
    local duty = getElementData(player, "duty")

    for k, v in pairs(suszarkaPermisions) do
        if duty and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            giveWeapon(player,24,1,true)
            return
        end
    end
end

-----------------------------------------------------
--------------------[ KomendySay ]---------------------
-----------------------------------------------------

function help(player)
    local duty = getElementData(player, "Administrator-Open")
    for k, v in pairs(commandHelp) do
        if duty then
            outputChatBox("---- #c22d2d[#6b6b6b!#c22d2d]#ffffff Komendy Administratora #c22d2d[#6b6b6b!#c22d2d]#ffffff ----",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /duty - wchodzisz/schodzisz na sluzbe.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /ac - admin chat.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /cv - tworzenie pojazdu.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /des - usuwanie pojazdu.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /fix - naprawianie pojazdu.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /vgod - godmode dla pojazdu.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /flip - obrocenie pojazdu.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /fly - latanie.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /hide - niewidzialnosc.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /cc - czyszczenie chatu.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /cds - czyszczenie debugscripta.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /se - setelementdata.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /ge - getelementdata.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /dev - devmode.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /gr - pobieranie rotacji.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /ap - dodawanie pp.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /rp - usuwanie pp.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /gi - daj item.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /god - godmode.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /tp - teleportuj do gracza.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /tph - teleprotuj gracza do siebie.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /tpb - teleportuj na ostatnia pozycje.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /tpbs - teleport do bazy (nie dziala).",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /cd - sprawdz statystyki duty.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /warn - ostrzezenie.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /spec - podgladanie gracza.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /ar - admin room.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#ffffff /suszarka - suszarka admina.",player, 255, 255, 255, true)
        end
    end
end

-----------------------------------------------------
--------------------[ Commands ]---------------------
-----------------------------------------------------

addCommandHandler('duty', setDuty)
addCommandHandler('acmd', help)
addCommandHandler('ac', adminChat)
addCommandHandler('cv', createVehicleForPlayer)
addCommandHandler('des', DestroyCar)
addCommandHandler('fix', fixCar)
addCommandHandler('vgod', GodCar)
addCommandHandler('flip', flipCar)
addCommandHandler('fly', Flying)
addCommandHandler('hide', hidePlayer)
addCommandHandler('cc', ClearChat)
addCommandHandler('cds', ClearDebugScript)
addCommandHandler('se', setelement)
addCommandHandler('ge', getelement)
addCommandHandler('dev', devmode)
addCommandHandler('gr', getRotation)
addCommandHandler('ap', addPoints)
addCommandHandler('rp', removePoints)
addCommandHandler('gi', giveItem)
addCommandHandler('god', godFunction)
addCommandHandler('tp', teleportToPlayer)
addCommandHandler('tph', teleportToHere)
addCommandHandler('tpl', teleportToLocation)
addCommandHandler('tpb', teleportBack)
addCommandHandler('tpba', teleportToBase)
addCommandHandler('cd', checkDuty)
addCommandHandler('warn', warnFunction)
addCommandHandler('spec', spectateFunction)
addCommandHandler('ar', adminRoomFunction)
addCommandHandler('suszarka', suszarkaFunction) -- by Korea