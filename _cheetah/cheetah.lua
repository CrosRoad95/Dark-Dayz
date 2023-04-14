txd = engineLoadTXD("cheetah.txd")
engineImportTXD(txd, 415)
dff = engineLoadDFF("cheetah.dff", 415)
engineReplaceModel(dff, 415)

-- generated with http://mta.dzek.eu/