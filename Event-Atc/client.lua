addEvent("zrzuc_box",true)
addEventHandler("zrzuc_box",root,function()
local x,y,z = getElementPosition(source)
local ground = getGroundPosition(x,y,z)
triggerServerEvent("zrzuc_box_server",root,ground,x,y,z-5)
end)


txd = engineLoadTXD("sanie.txd", 434)
engineImportTXD(txd, 434)
dff = engineLoadDFF("sanie.dff", 434)
engineReplaceModel(dff, 434) 