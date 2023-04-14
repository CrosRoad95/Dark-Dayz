local BasesPosition = {
    {1, -898.87, -468.12, 26.03},
    {2, 723.35, -464.58, 16.33},
    {3, 618.91, -594.34, 17.2},
    {4, 180.02, 1096.7, 16.713},
    {5, 784.3, -1388.97, 13.62},
    {6, -726.12, 962.77, 12.34},
    {7, 1015.52, 2387.15, 10.82},
    {8, 1966.80, 2158.30, 10.82},
    {9, 2603.85, 1435.50, 10.82},
    {10, 2391.94, 1041.64, 10.82},
    {11, 1910.31, 962.15, 10.82},
    {12, 980.48, 2087.10, 10.82},
    {13, 85.41, -292.32, 1.58},
    {14, 1694.77, -2092.31, 13.55},
    {15, 1527.32, -1448.85, 13.55},
    {16, 1647.43, -1522.45, 13.55},
    {17, 2418.16, -2442.56, 13.68},
    {18, 2073.34, -1828.54, 13.55},
    {19, -1424.96, 2592.07, 55.81},
    {20, -95.52, 1109.65, 19.74},
    {21, -357.09, 1192.54, 19.74},
    {22, 1354.87, 721.48, 10.82},
    {23, -397.57, -1057.49, 59.29},
    {24, 1034.83, 1170.18, 10.82},
    {25, 2854.10, 2200.91, 10.82},
    {26, -799.79, 2373.59, 151.95},
    {27, 1065.12, 1805.94, 10.82},
    {28, 2553.30, 970.92, 10.82},
    {29, 794.10, -611.86, 16.34},
    {30, 1045.26, -1031.32, 32.06},
    {31, 2649.06, -2034.75, 13.55},
    {32, 2738.26, -2001.50, 13.55},
    {33, 2399.44, 1480.80, 10.82},
    {34, 485.42, -1732.38, 11.11},
    {35, 1480.72, 2675.40, 10.82},
    {36, 2508.7900390625, -1686.84765625, 13.566009521484},
    {37, -783.01, 1433.02, 13.79},
    {38, 2300.35, 2040.28, 10.82},
    {39, -545.22, 2613.79, 53.52},
    {40, 1544.61, 1019.91, 10.82},
    {41, 2052.42, 2145.87, 10.82},
    {42, 1368.94, 2308.87, 10.82},
    {43, 2212.25, -2591.97, 13.55},
    {44, 953.90, -1213.61, 16.91},
    {45, 1977.03, -2065.68, 13.39},
    {46, 986.24, -1589.69, 13.49},
    {47, 1290.41, -1010.64, 30.94},
    {48, 2030.47, -1281.84, 20.96},
    {49, 1293.22, -1860.57, 13.55},
    {50, 2799.86, -1547.83, 10.92},
    {51, 963.00, -1438.72, 13.54},
    {52, 2142.81, 635.80, 10.82},
    {53, 2793.74, 2658.65, 10.82},
    {54, 1497.73, 2803.56, 10.82},
    {55, 2618.93, -2120.45, 13.55},
    {56, 1506.68, -702.69, 94.75},
    {57, 900.80, 2116.88, 10.82},
}


local ColorsTable = {
    ["Admin"] = "#CC2D2D[#CC2D2DWłaściciel#CC2D2D]#ffffff",
    ["Administrator"] ="#FC1212[Administrator]#ffffff",
    ["Moderator"] = "#009a06[Moderator]#ffffff",
    ["Support"] = "#32B7EB[Support]#ffffff",
    ["ChatMod"] = "#3FE85B[ChatMod]#ffffff",
    ["Developer"] = "#8B22A8[Developer]#ffffff",
    ["Administrator"] ="#FC1212[Administrator]#ffffff",
    ["Zasłużony"] ="#e0d143[Zasłużony]#ffffff",
}

local skin = {}
local AdminSkinTable = {
    {"testromson", 277},
    {"Holenderski123", 146}
}

local xback, yback, zback = {}, {}, {}

--------------------------------------------------------------
--                         Permision                        --
--------------------------------------------------------------

local ranks = {"Admin", "Administrator", "Moderator" ,"Support", "ChatMod", "Developer", "Zasłużony"}
local adminChatPermision = {"Admin", "Administrator", "Moderator" ,"Support", "ChatMod", "Developer"}
local createVehicleForPlayerPermision = {"Admin", "Administrator"}
local DestroyCarPermision = {"Admin", "Administrator"}
local fixCarPermision = {"Admin", "Administrator"}
local GodCarPermision = {"Admin", "Administrator"}
local flipCarPermision = {"Admin", "Administrator"}
local FlyingPermision = {"Admin", "Administrator", "Moderator"}
local hidePlayerPermision = {"Admin", "Administrator", "Moderator"}
local ClearChatPermision = {"Admin", "Administrator", "Moderator" ,"Support", "ChatMod", "Developer"}
local ClearDebugScriptPermision = {"Admin"}
local setelementPermision = {"Admin"}
local getelementPermision = {"Admin"}
local devmodePermision = {"Admin"}
local getPositionCorePermision = {"Admin", "Administrator", "Moderator"}
local getPositionPermision = {"Admin", "Administrator", "Moderator"}
local getRotationPermision = {"Admin", "Administrator", "Moderator"}
local addProveCoinsPermision = {"Admin", "Administrator"}
local removeProveCoinsPermision = {"Admin", "Administrator"}
local addMoneyPermision = {"Admin", "Administrator"}
local removeMoneyPermision = {"Admin", "Administrator"}
local giveItemPermision = {"Admin", "Administrator"}
local godFunctionPermision = {"Admin", "Administrator", "Moderator"}
local teleportToPlayerPermision = {"Admin", "Administrator", "Moderator"}
local teleportToHerePermision = {"Admin", "Administrator", "Moderator"}
local teleportToLocationPermision = {"Admin", "Administrator", "Moderator"}
local teleportBackPermision = {"Admin", "Administrator", "Moderator"}
local teleportToBasePermision = {"Admin", "Administrator", "Moderator"}
local checkDutyPermision = {"Admin", "Administrator", "Moderator" ,"Support", "ChatMod", "Developer"}
local warnFunctionPermision = {"Admin", "Administrator", "Moderator" ,"Support", "ChatMod"}
local SpectatePermision = {"Admin", "Administrator", "Moderator"}
local adminRoomFunctionPermision = {"Admin", "Administrator", "Moderator", "Support", "Developer"}

--------------------------------------------------------------
--                         Functions                        --
--------------------------------------------------------------

function DutyStatus(player)
    for k, v in pairs(ranks) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            setElementData(player,"duty",false)
            setElementModel(player, skin[player] or 73)
            outputChatBox("#c22d2d[#b75656✖#c22d2d]#FFFFFF Wylogowałeś się z duty - #9c9c9c"..ColorsTable[v],player, 255, 255, 255, true)
            triggerClientEvent("onPlayerDutyChange", player, player)
            return
        elseif isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            skin[player] = getElementModel(player)
            setElementData(player,"duty",v)
            for k,v in pairs(AdminSkinTable) do
                if v[1] == Name then
                    setElementModel(player, v[2])
                end
            end
            outputChatBox("#c22d2d[#56b769✔#c22d2d]#FFFFFF Zalogowałeś się na duty - #9c9c9c"..ColorsTable[v],player, 255, 255, 255, true)
            triggerClientEvent("onPlayerDutyChange", player, player)
            return
        end
    end
end

--------------------------------------------------------------

function adminChat(thePlayer, _, ... )
    for k, v in pairs(adminChatPermision) do
        local Name = getAccountName (getPlayerAccount(thePlayer))
        if isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            local message = table.concat ( { ... }, " " )
            if message == " " or message == "" or not message then TryCommand(thePlayer, "ac", "treść") return end
            if ( isPlayerOnGroup ( thePlayer ) ) then
                for _, player in ipairs ( getElementsByType ( "player" ) ) do
                    if ( isPlayerOnGroup ( player ) ) then
                         playSoundFrontEnd(player, 20)
                         outputChatBox ( "#c22d2dAC#6b6b6b >> #FFFFFF"..id(thePlayer).." "..ColorsTable[v].." ".. getPlayerName ( thePlayer ) ..": #9c9c9c".. message, player, 255, 255, 255, true )
                    end
                end
            end
        end
    end
end

function isPlayerOnGroup ( thePlayer )
    local account = getPlayerAccount ( thePlayer )
    local inGroup = false
    for k, v in pairs(adminChatPermision) do
        if isObjectInACLGroup ( "user.".. getAccountName ( account ), aclGetGroup ( v ) )   then
            inGroup = true
        end
    end
 
    return inGroup
end

--------------------------------------------------------------

function createVehicleForPlayer(player, cmd,  ...)
    for k, v in pairs(createVehicleForPlayerPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local model = table.concat ( { ... }, "" )

            if model == "" or not model then TryCommand(player, "cv", "model lub id pojazdu") return end

            if (tonumber(model) or 0) >= 400 and (tonumber(model) or 0) <= 611 then
                createvehicle(player, tonumber(model))
            elseif getVehicleModelFromName((tostring(model) or "")) then
                createvehicle(player, getVehicleModelFromName((tostring(model))))
            else
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie ma pojazdu o takim id lub nazwie.", player, 255, 255, 255, true)
            end

            break
        end
    end
end

function createvehicle(player, model)
    local Tires,Engine,parts,slots = exports.proveCore:getVehicleAddonInfos(model)
    if not Tires then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Serwer nie obsługuje tego pojazdu.", player, 255, 255, 255, true) return end
    local x,y,z = getElementPosition(player)
    local veh = createVehicle(model, x, y+1.5, z+0.5);
    local vehCol = createColSphere(x, y+1.5, z+0.5, 2.5);
    attachElements(vehCol, veh);
    setElementData(vehCol, "parent", veh);
    setElementData(veh, "parent", vehCol);
    setElementData(vehCol, "vehicle", true);
    setElementData(vehCol, "MAX_Slots", tonumber(slots));
    setElementData(vehCol, "Tire_inVehicle", Tires);
    setElementData(vehCol, "Engine_inVehicle", tonumber(Engine));
    setElementData(vehCol, "Parts_inVehicle", tonumber(parts));
    setElementData(vehCol, "fuel", 20);

    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Stworzyłeś pojazd #9c9c9c"..getVehicleName(veh), player, 255, 255, 255, true)
end

--------------------------------------------------------------


function DestroyCar(player, cmd)
    for k, v in pairs(DestroyCarPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            if not getPedOccupiedVehicle(player) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Musisz być w pojeździe!",player, 255, 255, 255, true) return end
            local vehicle = getPedOccupiedVehicle(player)
            local col = getElementData(vehicle, "parent")
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Usunąłeś pojazd #9c9c9c"..getVehicleName(vehicle),player, 255, 255, 255, true)
            destroyElement(col)
            destroyElement(vehicle)
        end
    end
end

--------------------------------------------------------------


function fixCar(player, cmd)
    for k, v in pairs(fixCarPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            if not getPedOccupiedVehicle(player) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Musisz być w pojeździe!",player, 255, 255, 255, true) return end
            local vehicle = getPedOccupiedVehicle(player)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Naprawiłeś pojazd #9c9c9c"..getVehicleName(vehicle),player, 255, 255, 255, true)
            fixVehicle(vehicle)
        end
    end
end

--------------------------------------------------------------


function GodCar(player, cmd)
    for k, v in pairs(GodCarPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            if not getPedOccupiedVehicle(player) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Musisz być w pojeździe!",player, 255, 255, 255, true) return end
            local vehicle = getPedOccupiedVehicle(player)
            local gstatus = getElementData(vehicle, "vgod")
            if gstatus then
                setElementData(vehicle,"vgod", false)
                setVehicleDamageProof(vehicle, false)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Z pojazd #9c9c9c"..getVehicleName(vehicle).."#ffffff god został usunięty.",player, 255, 255, 255, true)
            else
                setElementData(vehicle,"vgod", true)
                setVehicleDamageProof(vehicle, true)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Pojazd #9c9c9c"..getVehicleName(vehicle).."#ffffff otrzymał goda.",player, 255, 255, 255, true)
            end 
        end
    end
end

--------------------------------------------------------------


function flipCar(player, cmd)
    for k, v in pairs(flipCarPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            if not getPedOccupiedVehicle(player) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Musisz być w pojeździe!",player, 255, 255, 255, true) return end
            local vehicle = getPedOccupiedVehicle(player)
            local x, y, z = getElementPosition(vehicle)
            local rx, ry, rz = getElementRotation(vehicle)
            setElementRotation(vehicle, 0, 0, rz)
            setElementPosition(vehicle, x, y, z+1)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Flipnąłes pojazd #9c9c9c"..getVehicleName(vehicle),player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function Flying(player, cmd)
    for k, v in pairs(FlyingPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            if getElementData(player, "Ryjek") then
                setElementData(player,"Ryjek",false)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Możliwość włączynia/wyłączenia latania - #7c2020OFF",player, 255, 255, 255, true)
            else
                setElementData(player,"Ryjek",true)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Możliwość włączynia/wyłączenia latania - #56b769ON",player, 255, 255, 255, true)
            end
        end
    end
end

--------------------------------------------------------------


function hidePlayer(player, cmd)
    for k, v in pairs(hidePlayerPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local itm = {}
            for i=1,4 do
                if (i ~= 3) then
                    itm[i] = getElementData(player, "tohide"..i)
                end
            end
            if getElementData(player, "hidestatus") then
                setElementData(player,"hidestatus",false)
                setElementAlpha(player, 255)
                for i=1,4 do
                    if (i ~= 3) then
                        if itm[i] then setElementAlpha(itm[i], 255) end
                    end
                end
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Niewidzialność - #7c2020OFF",player, 255, 255, 255, true)
            else
                setElementData(player,"hidestatus",true)
                setElementAlpha(player, 0)
                for i=1,4 do
                    if (i ~= 3) then
                        if itm[i] then setElementAlpha(itm[i], 0) end
                    end
                end
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Niewidzialność - #56b769ON",player, 255, 255, 255, true)
            end
            return
        end
    end
end

--------------------------------------------------------------


function ClearChat(player, cmd)
    for k, v in pairs(ClearChatPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            for k, v in pairs(getElementsByType("player")) do
                clearChatBox(v)
            end
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Chat został wyczyszczony - "..id(player).." "..ColorsTable[v].." ".. getPlayerName(player).."#ffffff!",root, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function ClearDebugScript(player, cmd)
    for k, v in pairs(ClearDebugScriptPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            print("---------------------------------------------------") 
        end
    end
end

--------------------------------------------------------------


function setelement(player, cmd, arg1, nick2, element, value)
    for k, v in pairs(setelementPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not arg1 or not nick2 or not element then
                TryCommand(player, "se", "1 lub 2", "nick", "element", "wartość")
                return
            end

            if tonumber(arg1) == 1 then
                value = tonumber(value)
            end
                
            local nick = getPlayerFromName(nick2)
            element = ""..element..""
            setElementData(nick, element, value)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Wartość została zmieniona!",player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function getelement(player, cmd, nick2, element)
    for k, v in pairs(getelementPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not nick2 or not element then
                TryCommand(player, "ge", "nick", "element")
                return
            end

            local nick = getPlayerFromName(nick2)
            element = ""..element..""
            local element2 = getElementData(nick, element)

            if not nick then
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Te konto nie istnieje.",player, 255, 255, 255, true)
            elseif not element2 then
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Ta Data nie istnieje lub jest równa 0.",player, 255, 255, 255, true)
            elseif nick and element2 then
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Wartość jest równa: "..tostring(element2),player, 255, 255, 255, true)
            end     
        end
    end
end

--------------------------------------------------------------


function devmode(player)
    for k, v in pairs(devmodePermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            triggerClientEvent("devMode", player)
        end
    end
end

--------------------------------------------------------------


function getPosition(player)
    for k, v in pairs(getPositionPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local x, y, z = getElementPosition(player)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Twoje współrzedne: "..string.format("%.02f",x)..", "..string.format("%.02f",y)..", "..string.format("%.02f",z),player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function getPositionCore(player)
    for k, v in pairs(getPositionCorePermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local x, y, z = getElementPosition(player)
            outputChatBox("{"..x..", "..y..", "..z.."},",player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function getRotation(player)
    for k, v in pairs(getRotationPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            local x, y, z = getElementRotation(player)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Rotacja: "..string.format("%.02f",x)..", "..string.format("%.02f",y)..", "..string.format("%.02f",z),player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function addProveCoins(player, cmd, cat, nick, value)
    for k, v in pairs(addProveCoinsPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not cat or not nick or not value then
                TryCommand(player, "apc", "'offline' lub 'online'", "nick lub id", "ilość")
                return
            end

            value = math.floor(tonumber(value))

            if cat == "offline" then
                if not getAccount(nick) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Podane konto nie istnieje!",player, 255, 255, 255, true) return end
                local acc = getAccount(nick)
                if getAccountPlayer(acc) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie możesz dodawać PC osobie, która jest #56b769online#ffffff poprzez tryb dodawania #7c2020offline#ffffff!",player, 255, 255, 255, true) return end
                local pc = getAccountData(acc, "pc") or 0
                setAccountData(acc, "pc", pc + value)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Dodałeś #9c9c9c"..value.."PC#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość PC wynosi: #9c9c9c"..(pc+value),player, 255, 255, 255, true)
            elseif cat == "online" then
                if getPlayerFromName(nick) then
                    local plr = getPlayerFromName(nick)
                    local pc = getElementData(plr, "pc") or 0
                    local SenderNick = getPlayerName(player)
                    setElementData(plr, "pc", pc + value)
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Dodałeś #9c9c9c"..value.."PC#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość PC wynosi: #9c9c9c"..(pc+value),player, 255, 255, 255, true)
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Otrzymałeś #9c9c9c"..value.."PC#ffffff od użytkownika #9c9c9c"..SenderNick.."",plr, 255, 255, 255, true)
                else
                    for k, v in pairs(getElementsByType("player")) do
                        if getElementData(v, "id") == tonumber(nick) then
                            local pc = getElementData(v, "pc") or 0
                            nick = getPlayerName(v)
                            setElementData(v, "pc", pc + value)
                            local SenderNick = getPlayerName(player)
                            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Dodałeś #9c9c9c"..value.."PC#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość PC wynosi: #9c9c9c"..(pc+value),player, 255, 255, 255, true)
                            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Otrzymałeś #9c9c9c"..value.."PC#ffffff od użytkownika #9c9c9c"..SenderNick.."",v, 255, 255, 255, true)
                        return
                        end
                    end
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                end
            end

        end
    end
end

--------------------------------------------------------------


function removeProveCoins(player, cmd, cat, nick, value)
    for k, v in pairs(removeProveCoinsPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not cat or not nick or not value then
                TryCommand(player, "rpc", "'offline' lub 'online'", "nick lub id", "ilość")
                return
            end

            value = math.floor(tonumber(value))

            if cat == "offline" then
                if not getAccount(nick) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Podane konto nie istnieje!",player, 255, 255, 255, true) return end
                local acc = getAccount(nick)
                if getAccountPlayer(acc) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie możesz odejmować PC osobie, która jest #56b769online#ffffff poprzez tryb odejmowania #7c2020offline#ffffff!",player, 255, 255, 255, true) return end
                local pc = getAccountData(acc, "pc") or 0
                setAccountData(acc, "pc", pc - value)
                if getAccountData(acc, "pc") < 0 then setAccountData(acc, "pc", 0) end
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Odjąłeś #9c9c9c"..value.."PC#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość PC wynosi: #9c9c9c"..getAccountData(acc, "pc"),player, 255, 255, 255, true)
            elseif cat == "online" then
                if getPlayerFromName(nick) then
                    local plr = getPlayerFromName(nick)
                    local pc = getElementData(plr, "pc") or 0
                    local SenderNick = getPlayerName(player)
                    setElementData(plr, "pc", pc - value)
                    if getElementData(plr, "pc") < 0 then setElementData(plr, "pc", 0) end
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Odjąłeś #9c9c9c"..value.."PC#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość PC wynosi: #9c9c9c"..getElementData(plr, "pc"),player, 255, 255, 255, true)
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Straciłeś #9c9c9c"..value.."PC#ffffff przez użytkownika #9c9c9c"..SenderNick.."",plr, 255, 255, 255, true)
                else
                    for k, v in pairs(getElementsByType("player")) do
                        if getElementData(v, "id") == tonumber(nick) then
                            local pc = getElementData(v, "pc") or 0
                            nick = getPlayerName(v)
                            setElementData(v, "pc", pc - value)
                            local SenderNick = getPlayerName(player)
                            if getElementData(v, "pc") < 0 then setElementData(v, "pc", 0) end
                            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Odjąłeś #9c9c9c"..value.."PC#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz jego ilość PC wynosi: #9c9c9c"..getElementData(v, "pc"),player, 255, 255, 255, true)
                            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Straciłeś #9c9c9c"..value.."PC#ffffff od użytkownika #9c9c9c"..SenderNick.."",v, 255, 255, 255, true)
                        return
                        end
                    end
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                end
            end

        end
    end
end

--------------------------------------------------------------


function addMoney(player, cmd, cat, nick, value)
    for k, v in pairs(addMoneyPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not cat or not nick or not value then
                TryCommand(player, "am", "'offline' lub 'online'", "nick lub id", "ilość")
                return
            end

            value = math.floor(tonumber(value))

            if cat == "offline" then
                if not getAccount(nick) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Podane konto nie istnieje!",player, 255, 255, 255, true) return end
                local acc = getAccount(nick)
                if getAccountPlayer(acc) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie możesz dodawać pieniędzy osobie, która jest #56b769online#ffffff poprzez tryb dodawania #7c2020offline#ffffff!",player, 255, 255, 255, true) return end
                local pc = getAccountData(acc, "money") or 0
                setAccountData(acc, "money", pc + value)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Dodałeś #9c9c9c"..value.."$#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz saldo konta wynosi: #9c9c9c"..(pc+value).."$",player, 255, 255, 255, true)
            elseif cat == "online" then
                if getPlayerFromName(nick) then
                    local plr = getPlayerFromName(nick)
                    local pc = getElementData(plr, "money") or 0
                    local SenderNick = getPlayerName(player)
                    setElementData(plr, "money", pc + value)
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Dodałeś #9c9c9c"..value.."$#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz saldo konta wynosi: #9c9c9c"..(pc+value).."$",player, 255, 255, 255, true)
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Otrzymałeś #9c9c9c"..value.."$#ffffff od użytkownika #9c9c9c"..SenderNick.."",plr, 255, 255, 255, true)
                else
                    for k, v in pairs(getElementsByType("player")) do
                        if getElementData(v, "id") == tonumber(nick) then
                            local pc = getElementData(v, "money") or 0
                            nick = getPlayerName(v)
                            setElementData(v, "money", pc + value)
                            local SenderNick = getPlayerName(player)
                            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Dodałeś #9c9c9c"..value.."$#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz saldo konta wynosi: #9c9c9c"..(pc+value).."$",player, 255, 255, 255, true)
                            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Otrzymałeś #9c9c9c"..value.."$#ffffff od użytkownika #9c9c9c"..SenderNick.."",v, 255, 255, 255, true)
                        return
                        end
                    end
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                end
            end

        end
    end
end

--------------------------------------------------------------


function removeMoney(player, cmd, cat, nick, value)
    for k, v in pairs(removeMoneyPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not cat or not nick or not value then
                TryCommand(player, "rm", "'offline' lub 'online'", "nick lub id", "ilość")
                return
            end

            value = math.floor(tonumber(value))

            if cat == "offline" then
                if not getAccount(nick) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Podane konto nie istnieje!",player, 255, 255, 255, true) return end
                local acc = getAccount(nick)
                if getAccountPlayer(acc) then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie możesz odejmować pieniędzy osobie, która jest #56b769online#ffffff poprzez tryb odejmowania #7c2020offline#ffffff!",player, 255, 255, 255, true) return end
                local pc = getAccountData(acc, "money") or 0
                setAccountData(acc, "money", pc - value)
                if getAccountData(acc, "money") < 0 then setAccountData(acc, "money", 0) end
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Odjąłeś #9c9c9c"..value.."$#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz saldo konta wynosi: #9c9c9c"..getAccountData(acc, "money").."$",player, 255, 255, 255, true)
            elseif cat == "online" then
                if getPlayerFromName(nick) then
                    local plr = getPlayerFromName(nick)
                    local pc = getElementData(plr, "money") or 0
                    local SenderNick = getPlayerName(player)
                    setElementData(plr, "money", pc - value)
                    if getElementData(plr, "money") < 0 then setElementData(plr, "money", 0) end
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Odjąłeś #9c9c9c"..value.."$#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz saldo konta wynosi: #9c9c9c"..getElementData(plr, "money").."$",player, 255, 255, 255, true)
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Straciłeś #9c9c9c"..value.."$#ffffff przez użytkownika #9c9c9c"..SenderNick.."",plr, 255, 255, 255, true)
                else
                    for k, v in pairs(getElementsByType("player")) do
                        if getElementData(v, "id") == tonumber(nick) then
                            local pc = getElementData(v, "money") or 0
                            nick = getPlayerName(v)
                            setElementData(v, "money", pc - value)
                            local SenderNick = getPlayerName(player)
                            if getElementData(v, "money") < 0 then setElementData(v, "money", 0) end
                            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Odjąłeś #9c9c9c"..value.."$#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff. Teraz saldo konta wynosi: #9c9c9c"..getElementData(v, "money").."$",player, 255, 255, 255, true)
                            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Straciłeś #9c9c9c"..value.."$#ffffff od użytkownika #9c9c9c"..SenderNick.."",v, 255, 255, 255, true)
                        return
                        end
                    end
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                end
            end

        end
    end
end

function giveItem(player, cmd, nick, value, ...)
    for k, v in pairs(giveItemPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        local item = table.concat ( { ... }, " " )
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            if not nick or not item or not value then
                TryCommand(player, "gi", "nick lub id", "ilość", "przedmiot")
                return
            end

            local plr

            if getPlayerFromName(nick) then
                plr = getPlayerFromName(nick)
            else
                for k, v in pairs(getElementsByType("player")) do
                    if getElementData(v, "id") == tonumber(nick) then
                        plr = v
                    return
                    end
                end
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                return
            end

            local item2 = getElementData(plr, item)
            local SenderNick = getPlayerName(player)
            setElementData(plr, item, item2 + tonumber(value))
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Dodałeś #9c9c9c"..value.." "..item.."#ffffff użytkownikowi #9c9c9c"..nick.."#ffffff.",player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Orzymałeś #9c9c9c"..value.." "..item.."#ffffff od #9c9c9c"..SenderNick.."#ffffff.",player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function godFunction(player)
    for k, v in pairs(godFunctionPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            if getElementData(player, "god") then
                setElementData(player,"god",false)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF GodMode - #7c2020OFF",player, 255, 255, 255, true)
            else
                setElementData(player,"god",true)
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF GodMode - #56b769ON",player, 255, 255, 255, true)
            end
        end
    end
end

--------------------------------------------------------------


function teleportToPlayer(player, cmd, nick)
    for k, v in pairs(teleportToPlayerPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            
            if not nick then
                TryCommand(player, "tp", "nick lub id")
                return
            end

            local plr

            if getPlayerFromName(nick) then
                plr = getPlayerFromName(nick)
            else
                for k, v in pairs(getElementsByType("player")) do
                    if getElementData(v, "id") == tonumber(nick) then
                        plr = v
                    end
                end
                if plr == nil then
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                    return
                end
            end

            local lx, ly, lz = getElementPosition(player)
            xback[player], yback[player], zback[player] = lx, ly, lz
            
            local x, y, z = getElementPosition(plr)
            setElementPosition(player, x+1, y+2, z)

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Przeniesiono do gracza #9c9c9c"..getPlayerName(plr),player, 255, 255, 255, true)
            if getElementData(plr, "duty") == "Admin" then
                outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Administrator #9c9c9c"..getPlayerName(player).."#ffffff przeteleportował się do ciebie",plr, 255, 255, 255, true)
            end
        end
    end
end

--------------------------------------------------------------


function teleportToHere(player, cmd, nick)
    for k, v in pairs(teleportToHerePermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            
            if not nick then
                TryCommand(player, "tph", "nick lub id")
                return
            end

            local plr

            if getPlayerFromName(nick) then
                plr = getPlayerFromName(nick)
            else
                for k, v in pairs(getElementsByType("player")) do
                    if getElementData(v, "id") == tonumber(nick) then
                        plr = v
                    end
                end
                if plr == nil then
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                    return
                end
            end
            
            local x, y, z = getElementPosition(player)
            setElementPosition(plr, x+1, y+2, z)

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Przeniesiono do ciebie gracza #9c9c9c"..getPlayerName(plr),player, 255, 255, 255, true)
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Administrator #9c9c9c"..getPlayerName(player).."#ffffff przeteleportował cię do siebie",plr, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function teleportToLocation(player, cmd, x, y, z)
    for k, v in pairs(teleportToLocationPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            
            if not x or not y or not z then
                TryCommand(player, "tpj", "x", "y", "z")
                return
            end

            local lx, ly, lz = getElementPosition(player)
            xback[player], yback[player], zback[player] = lx, ly, lz

            x, y, z = tonumber(x), tonumber(y), tonumber(z)

            setElementPosition(player, x, y, z)

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Przeniesiono na #9c9c9c"..x..", "..y..", "..z,player, 255, 255, 255, true)

        end
    end
end

--------------------------------------------------------------

function teleportBack(player, cmd, id)
    for k, v in pairs(teleportToBasePermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            if not xback[player] then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie posiadasz zapisanej ostatniej lokacji.", player, 255, 255, 255, true) return end

            setElementPosition(player, xback[player], yback[player], zback[player])

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Przeniesiono na #9c9c9c"..xback[player]..", "..yback[player]..", "..zback[player],player, 255, 255, 255, true)
        end
    end
end

--------------------------------------------------------------


function teleportToBase(player, cmd, id)
    for k, v in pairs(teleportBackPermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            if not id then
                TryCommand(player, "tpba", "id bazy")
                return
            end

            for k, v in pairs(BasesPosition) do
                if v[1] == tonumber(id) then
                    local lx, ly, lz = getElementPosition(player)
                    xback[player], yback[player], zback[player] = lx, ly, lz
                    setElementPosition(player, v[2], v[3], v[4])
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Przeniesiono pod baze: #9c9c9c"..id,player, 255, 255, 255, true)
                    return
                end
            end

        end
    end
end


--------------------------------------------------------------


function checkDuty(player)
    for k, v in pairs(checkDutyPermision) do
        local Name = getAccountName (getPlayerAccount(player))
        if isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF ------ Lista czasu duty - prove-mta.pl ------",player, 255, 255, 255, true)

            for k, v in pairs(getAccounts()) do
                if getAccountData(v, "dutyTime") then
                    local accName = getAccountName(v)
                    if getAccountPlayer(v) then
                        outputChatBox("#9c9c9c"..accName.."#ffffff - "..getElementData(getAccountPlayer(v), "dutyTime").."min",player, 255, 255, 255, true)
                    else
                        outputChatBox("#9c9c9c"..accName.."#ffffff - "..getAccountData(v, "dutyTime").."min",player, 255, 255, 255, true)
                    end
                end
            end

            outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF ---------------------------------------------------------",player, 255, 255, 255, true)

        end
    end
end

--------------------------------------------------------------


function warnFunction(player, cmd, nick, ...)
    for k, v in pairs(warnFunctionPermision) do
        local Name = getAccountName (getPlayerAccount(player))
        if isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            
            
            if not player or not nick or not { ... } then
                TryCommand(player, "warn", "nick lub id", "powód")
                return
            end

            local plr

            if getPlayerFromName(nick) then
                plr = getPlayerFromName(nick)
            else
                for k, v in pairs(getElementsByType("player")) do
                    if getElementData(v, "id") == tonumber(nick) then
                        plr = v
                    end
                end
                if plr == nil then
                    outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                    return
                end
            end

            if player == plr then return end

            local message = table.concat ( { ... }, " " )

            if not PermisionRankCheck(player, plr) then
                outputChatBox ( "#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie posiadasz permisji, aby wykonać operację na tej osobie. #9c9c9c"..getPlayerName(plr).."#ffffff dostał informacje o twojej próbie wykonania operacji.", player, 255, 100, 70, true )
                outputChatBox ( "#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Administrator #9c9c9c"..getPlayerName(player).."#ffffff usiłował wykonac na tobie operację: #9c9c9cwarn #ffffff- "..message, plr, 255, 100, 70, true )
                return
            end


            local warn = getElementData(plr, "warn") or 0
            setElementData(plr, "warn", warn+1)
            if (getElementData(plr, "warn") or 0) > 2 then 
                setTimer ( outputConsole, 99, 1, "\n\n\n\n\n\n\n\n--------------------------------------\nZespół prove-mta.pl\n\nOtrzymałeś kicka od "..getPlayerName(player).."\nPowód: 3/3 ostrzeżeń | Treść ostatniego ostrzeżenia: "..message.."\n--------------------------------------", plr )
                setTimer ( kickPlayer, 100, 1, plr, player, "Sprawdź konsolę" )
            end

            triggerClientEvent ( "notificationsServer", plr, "#ff4040Ostrzeżenie("..(getElementData(plr, "warn") or 0).."/3) od "..getPlayerName(player).."#ffffff\nPowód: "..message, true, 15)
            triggerClientEvent ( "startRollMessageServer", root, "#ff4040"..getPlayerName(plr):gsub("#%x%x%x%x%x%x", "").."#ffffff otrzymał ostrzeżenie("..(getElementData(plr, "warn") or 0).."/3) od #ff4040"..getPlayerName(player):gsub("#%x%x%x%x%x%x", ""), 255, 255, 255)
        end
    end
end

--------------------------------------------------------------


function spectateFunction(player, cmd, nick)
    for k, v in pairs(SpectatePermision) do
        local duty = getElementData(player, "duty")
        local Name = getAccountName (getPlayerAccount(player))
        if duty == v and isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then

            local spectate = getElementData(player, "spectate")

            if not spectate then

                if not player or not nick then
                    TryCommand(player, "spec", "nick lub id")
                    return
                end

                local plr = getPlayerFromName(nick)
            
                if plr then
                    plr = getPlayerFromName(nick)
                    if plr == player then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie możesz siebie spectować!",player, 255, 255, 255, true) return end
                else
                    for k, v in pairs(getElementsByType("player")) do
                        if getElementData(v, "id") == tonumber(nick) then
                            plr = v
                            if plr == player then outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie możesz siebie spectować!",player, 255, 255, 255, true) return end
                            break
                        end
                    end
                    if plr == nil then
                        outputChatBox("#c22d2d[#6b6b6b!#c22d2d]#FFFFFF Nie znaleziono gracza o tej nazwie lub id!",player, 255, 255, 255, true)
                        return
                    end
                end

                triggerClientEvent("onAdminStartSpectating", player, player, plr)
            else
                triggerClientEvent("onAdminStartSpectating", player, player)
            end
            
        end
    end
end

--------------------------------------------------------------


function adminRoomFunction(player)
    for k, v in pairs(adminRoomFunctionPermision) do
        local Name = getAccountName (getPlayerAccount(player))
        local duty = getElementData(player, "duty")
        if isObjectInACLGroup ("user."..Name, aclGetGroup (v)) then
            if duty then
                triggerClientEvent("onPlayerUseAdminRoom", player, player, getElementData(player, "aroom_status"))
            end
        end
    end
end

--------------------------------------------------------------
--                         Events                           --
--------------------------------------------------------------



--------------------------------------------------------------
--                         Commands                         --
--------------------------------------------------------------

addCommandHandler('duty', DutyStatus)
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
addCommandHandler('gp', getPosition)
addCommandHandler('gpc', getPositionCore)
addCommandHandler('gr', getRotation)
addCommandHandler('apc', addProveCoins)
addCommandHandler('rpc', removeProveCoins)
addCommandHandler('am', addMoney)
addCommandHandler('rm', removeMoney)
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
