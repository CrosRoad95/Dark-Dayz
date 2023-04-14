txd = engineLoadTXD("nemesis.txd",244 )
engineImportTXD(txd, 244)
dff = engineLoadDFF("nemesis.dff", 244 )
engineReplaceModel(dff, 244)

