-- Developer: ClawSuit
-- Discord: ♱ ᑕᒪᗩᗯᔕᑌIT ♱#0284

--// Data base editor:
--|| Secuencia de tablas + eventos + registro db
--\\---------------------------------------------

SQL = {}
SQL.handler = {}
SQL.events = {
    'SQL.getTablas',
    'SQL.getDB',
    'SQL.saveChanges',
}

SQL.handler = false
SQL.path = {}


SQL.addEvents = function()
    for i = 1, #SQL.events do
        addEvent(SQL.events[i], true)
        addEventHandler(SQL.events[i], getRootElement(), SQL[SQL.events[i]:sub(5)])
    end
end

SQL.getTablas = function(path)
    if fileExists(path) then
    	if SQL.path[client] ~= path then

    		SQL.path[client] = path

	        SQL.handler = Connection( "sqlite", path )
	        local db = SQL.handler:query('SELECT * FROM sqlite_master WHERE type = "table"'):poll(-1)

	        if (db) and (#db > 0) then
	            local tablas = {}
	            for _,v in ipairs(db) do
	                table.insert(tablas, v.name)
	            end
	            client:triggerEvent('SQL.getTablas', resourceRoot, tablas)
	            return client:triggerEvent('SQL.showNotice', resourceRoot, 3)
	        end

	    end
    end
    return client:triggerEvent('SQL.showNotice', resourceRoot, 2)
end

SQL.getDB = function(path, name, _typ)
    if path:find('.db') and fileExists(path) then 
        if SQL.path[client] == path then
	        if (SQL.handler) then

	            local db = SQL.handler:query('select * from '..name):poll(-1)
	            if db then
	                local dbc = SQL.handler:query('pragma table_info('..name..')'):poll(-1)

	                local columns = {}
	                if dbc then
	                    for _,v in ipairs(dbc) do
	                        table.insert(columns, v.name)
	                    end
	                end

	                if _typ then
	                    client:triggerEvent('SQL.showNotice', resourceRoot, _typ)
	                end
	                return client:triggerEvent('SQL.getDB', resourceRoot, columns, db)
	            else
	    
	                return client:triggerEvent('SQL.showNotice', resourceRoot, 6)
	            end
	        end
	    end
    end
    return client:triggerEvent('SQL.showNotice', resourceRoot, 2)
end

SQL.saveChanges = function(path, table, data)
    if fileExists(path) then
        if SQL.path[client] == path then
	        if (SQL.handler) then

	            dbFree(SQL.handler:query('DELETE FROM '..table))

	            for i, v in ipairs(data) do
	                local signos = ('?,'):rep(#v)
	                signos = signos:sub(1,#signos-1)
	                dbFree(SQL.handler:query('Insert Into '..table..' Values ('..signos..')', unpack(v)))
	            end

	            return client:triggerEvent('SQL.showNotice', resourceRoot, 1)
	        end
	    end
    end
    return client:triggerEvent('SQL.showNotice', resourceRoot, 2)
end

SQL.resourceStart = function(res)
    if not isObjectInACLGroup("resource."..res.name, aclGetGroup("Admin")) then
        outputChatBox('Para activar el script es necesario agregarlo al ACL Admin', root, 255,255,0)
        outputChatBox('To activate the script, you must add it to the ACL administrator', root, 255,255,0)
        cancelEvent(true)
    end

    SQL.addEvents()
end
addEventHandler("onResourceStart", resourceRoot, SQL.resourceStart)

addCommandHandler('dbeditor',
    function(player)
        if ( hasObjectPermissionTo ( player, "general.adminpanel" ) ) then
            player:triggerEvent('SQL.showDbEditor', resourceRoot)
        end
    end
)
