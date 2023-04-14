

txd = engineLoadTXD ('najbrama1.txd') 
engineImportTXD (txd, 2932) 
dff = engineLoadDFF('najbrama1.dff', 2932) 
engineReplaceModel (dff, 2932)
col = engineLoadCOL ('najbrama1.col')
engineReplaceCOL (col, 2932)
engineSetModelLODDistance(2932,1000)
			