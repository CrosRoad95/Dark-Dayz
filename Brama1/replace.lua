

txd = engineLoadTXD ('najbrama1.txd') 
engineImportTXD (txd, 10828) 
dff = engineLoadDFF('najbrama1.dff', 10828) 
engineReplaceModel (dff, 10828)
col = engineLoadCOL ('najbrama1.col')
engineReplaceCOL (col, 10828)
engineSetModelLODDistance(10828,1000)
			