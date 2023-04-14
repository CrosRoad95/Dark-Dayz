local txd = engineLoadTXD("jebac.txd", true)
engineImportTXD(txd, 1935)
local dff = engineLoadDFF("jebac.dff")
engineReplaceModel(dff, 1935, true)
local col = engineLoadCOL ("jebac.col")
engineReplaceCOL (col, 1935)

engineSetModelLODDistance(1935,1000)