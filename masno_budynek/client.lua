dff = engineLoadDFF ( "budynek.dff" )
engineReplaceModel ( dff, 4058 )
col = engineLoadCOL ( "budynek.col" )
engineReplaceCOL ( col, 4058 )

engineSetModelLODDistance(4058, 300)

--local obj = createObject(4058, 1902.5437011719, -1479.4937744141, 124.86907196045)