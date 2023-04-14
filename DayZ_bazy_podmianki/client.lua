
local txd = engineLoadTXD('Baza1.txd',true)
engineImportTXD(txd, 6875)
local dff = engineLoadDFF('Baza1.dff', 0)
engineReplaceModel(dff, 6875)
local col = engineLoadCOL('Baza1.col')
engineReplaceCOL(col, 6875)
engineSetModelLODDistance(6875, 301)



local txd = engineLoadTXD('Baza2.txd',true)
engineImportTXD(txd, 10949)
local dff = engineLoadDFF('Baza2.dff', 0)
engineReplaceModel(dff, 10949)
local col = engineLoadCOL('Baza2.col')
engineReplaceCOL(col, 10949)
engineSetModelLODDistance(10949, 301)

local txd = engineLoadTXD('Baza3.txd',true)
engineImportTXD(txd, 5313)
local dff = engineLoadDFF('Baza3.dff', 0)
engineReplaceModel(dff, 5313)
local col = engineLoadCOL('Baza3.col')
engineReplaceCOL(col, 5313)
engineSetModelLODDistance(5313, 301)