txd = engineLoadTXD("uh1y_dayz.txd")
engineImportTXD(txd, 1882)
col = engineLoadCOL ("uh1y_dayz.col")
engineReplaceCOL (col, 1882)
dff = engineLoadDFF("uh1y_dayz.dff", 0)
engineReplaceModel(dff, 1882)
engineSetModelLODDistance(1882, 300)