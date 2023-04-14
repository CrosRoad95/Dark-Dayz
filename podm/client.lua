function replaceModel()
txd = engineLoadTXD('sultan.txd',560)
engineImportTXD(txd,560)
dff = engineLoadDFF('sultan.dff',560)
engineReplaceModel(dff,560)
end
addEventHandler ( 'onClientResourceStart', getResourceRootElement(getThisResource()), replaceModel)