local txd = engineLoadTXD ( "flara.txd", 343  )
engineImportTXD ( txd,  343 )
local dff = engineLoadDFF("flara.dff", 343  )
engineReplaceModel( dff, 343  )
