		


txd = engineLoadTXD ('sredniabaza.txd') 
engineImportTXD (txd, 10230) 
dff = engineLoadDFF('sredniabaza.dff', 10230) 
engineReplaceModel (dff, 10230)
col = engineLoadCOL ('sredniabaza.col')
engineReplaceCOL (col, 10230)
engineSetModelLODDistance(1938,1000)