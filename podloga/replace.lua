
dff = engineLoadDFF('podloga.dff', 3017) 
engineReplaceModel (dff, 3017)
col = engineLoadCOL ('podloga.col')
engineReplaceCOL (col, 3017)
engineSetModelLODDistance(3017,1000)
			