local txd = engineLoadTXD("sandbag.txd", true)
engineImportTXD(txd, 14843)
local dff = engineLoadDFF("sandbag.dff")
engineReplaceModel(dff, 14843, true)
local col = engineLoadCOL ("sandbag.col")
engineReplaceCOL (col, 14843)