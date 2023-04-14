local TrueFalseTable = {
    [true] = "#32c732ON",
    [false] = "#c73e32OFF",
}

-----------------------------------------------------
--------------------[ Permisions ]-------------------
-----------------------------------------------------

local getPositionPermisions = {"Console", "Admin", "Vice Admin", "Pomocnik", "Pomocnik2", " Moderator2", "ModChat"}
local getPositionToTablePermisions = {"Console", "Admin"}
local setTagStatusPermisions = {"Console", "Admin"}

-----------------------------------------------------
--------------------[ Functions ]--------------------
-----------------------------------------------------


function getPosition()
    if not getPlayerRank(localPlayer, getPositionPermisions) then return end
    
    local x, y, z = getElementPosition(localPlayer)

    outputChatBox("#d63838[!] #ffffffPozycja: "..string.format("%.02f",x)..", "..string.format("%.02f",y)..", "..string.format("%.02f",z), 255, 255, 255, true)
end

-----------------------------------------------------

function getPositionToTable()
    if not getPlayerRank(localPlayer, getPositionToTablePermisions) then return end
    
    local x, y, z = getElementPosition(localPlayer)

    outputChatBox("{"..string.format("%.02f",x)..", "..string.format("%.02f",y)..", "..string.format("%.02f",z).."},", 255, 255, 255, true)
end

-----------------------------------------------------

function setTagStatus()
    local rank = getPlayerRank(localPlayer, setTagStatusPermisions) if not rank then return end
    
    local status = getElementData(localPlayer, 'showAdmin')
    if (not status) then
        setElementData(localPlayer, 'showAdmin', rank)
    else
        setElementData(localPlayer, 'showAdmin', false)
    end
    outputChatBox("#c22d2d[#6b6b6b!#c22d2d] #ffffffTag status: "..TrueFalseTable[not status], 255, 255, 255, true)
end


-----------------------------------------------------
--------------------[ Commands ]---------------------
-----------------------------------------------------

addCommandHandler( "gp", getPosition)
addCommandHandler( "gpt", getPositionToTable)
addCommandHandler( "tag", setTagStatus)