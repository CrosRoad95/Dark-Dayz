

txd = engineLoadTXD ('najbrama1.txd') 
engineImportTXD (txd, 10841) 
dff = engineLoadDFF('najbrama1.dff', 10841) 
engineReplaceModel (dff, 10841)
col = engineLoadCOL ('najbrama1.col')
engineReplaceCOL (col, 10841)
			