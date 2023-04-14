txd = engineLoadTXD("uranus.txd")
engineImportTXD(txd, 558)
dff = engineLoadDFF("uranus.dff", 558)
engineReplaceModel(dff, 558)

-- generated with http://mta.dzek.eu/