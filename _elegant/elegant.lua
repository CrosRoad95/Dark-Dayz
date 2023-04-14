txd = engineLoadTXD("elegant.txd")
engineImportTXD(txd, 507)
dff = engineLoadDFF("elegant.dff", 507)
engineReplaceModel(dff, 507)