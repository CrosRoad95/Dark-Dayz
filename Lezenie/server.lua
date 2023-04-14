for i,v in pairs(getElementsByType('player')) do
setElementData(v,'Lezy',false)
end

local players_tick = {}

function binduj(gracz)
bindKey(gracz,'l','down',function(plr)
if getElementData(plr, "block") == true then return end
if not getElementData(plr,'Lezy') then
if getPedOccupiedVehicle(plr) then return end
if not getElementData(plr,'Moze-Lezec') then return end
if not players_tick[plr] then
    players_tick[plr] = getTickCount()
elseif getTickCount()-players_tick[plr]<2000 then
    outputChatBox("Musisz odczekac 2s!",plr)
    return
end
players_tick[plr] = getTickCount()
  setPedAnimation ( plr, "ped", "FLOOR_hit_f", -1, false, false )
--setPedAnimation(plr, "WUZI", "CS_Dead_Guy",-1,true,true,true,true);
triggerClientEvent(plr,'GetFuck',plr)
setElementData(plr,'Lezy',true)
elseif getElementData(plr,'Lezy') then
setElementData(plr,'Lezy',false)
setPedAnimation(plr)
end
end)
end


addEventHandler('onPlayerJoin',root,function()
binduj(source)
end)

addEventHandler('onResourceStart',resourceRoot,function()
for _,v in pairs(getElementsByType('player')) do
	binduj(v)
end
end)

addEvent('TakoDziewczyneHaline',true)


addEventHandler('TakoDziewczyneHaline',resourceRoot,function(g)
setElementData(g,'Lezy',false)
end)