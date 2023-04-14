-- Developer: ClawSuit
-- Discord: ♱ ᑕᒪᗩᗯᔕᑌIT ♱#0284

--// Data base editor:
--|| Interfaz GUI + introducción de datos
--\\--------------------------------------

local SQL = {}
SQL.events = {
    'SQL.getTablas',
    'SQL.getDB',
    'SQL.showNotice',
    'SQL.showDbEditor',
    'onClientGUIClick',
    'onClientGUIDoubleClick',
}

GUIEditor = {
    label = {},
    staticimage = {},
    combobox = {},
    edit = {},
    button = {},
    window = {},
    gridlist = {},
    memo = {}
}

GUIEditor.window[1] = GuiWindow(0.03, 0.12, 0.94, 0.76, "DB SQLite Editor - v1.0", true)
GUIEditor.window[1]:setSizable(false)
GUIEditor.window[1]:setVisible(false)

GUIEditor.edit[1] = GuiEdit(0.01, 0.05, 0.29, 0.04, "Escriba la ruta de la base de datos", true, GUIEditor.window[1])

GUIEditor.button[1] = GuiButton(0.32, 0.05, 0.09, 0.04, "Cargar DB", true, GUIEditor.window[1])
GUIEditor.button[1]:setProperty("NormalTextColour", "FFAAAAAA")

GUIEditor.combobox[1] = GuiComboBox(0.01, 0.09, 0.20, 0.20, "Tablas:", true, GUIEditor.window[1])

GUIEditor.gridlist[1] = GuiGridList(0.01, 0.14, 0.64, 0.80, true, GUIEditor.window[1])
GUIEditor.gridlist[1]:setSortingEnabled(false)

GUIEditor.staticimage[1] = GuiStaticImage(0.35, 0.1, 0.03, 0.035, "files/refresh.png", true, GUIEditor.window[1])
GUIEditor.button[2] = GuiButton(0.42, 0.09, 0.10, 0.04, "Nuevo Registro", true, GUIEditor.window[1])
GUIEditor.button[2]:setProperty("NormalTextColour", "FFAAAAAA")

GUIEditor.button[3] = GuiButton(0.54, 0.09, 0.10, 0.04, "Borrar Registro", true, GUIEditor.window[1])
GUIEditor.button[3]:setProperty("NormalTextColour", "FFAAAAAA")

GUIEditor.memo[1] = GuiMemo(0.66, 0.14, 0.33, 0.46, "", true, GUIEditor.window[1])

GUIEditor.button[4] = GuiButton(0.87, 0.61, 0.11, 0.05, "Aplicar", true, GUIEditor.window[1])
GUIEditor.button[4]:setProperty("NormalTextColour", "FFAAAAAA")

GUIEditor.label[1] = GuiLabel(0.66, 0.61, 0.20, 0.05, "Tipo de dato actualmente en la celda: Texto / numerico", true, GUIEditor.window[1])
GUIEditor.label[1]:setHorizontalAlign("center", true)

GUIEditor.button[5] = GuiButton(0.75, 0.80, 0.16, 0.05, "Guardar Cambios", true, GUIEditor.window[1])
GUIEditor.button[5]:setProperty("NormalTextColour", "FFAAAAAA")

GUIEditor.button[6] = GuiButton(0.949, 0.94, 0.031, 0.036, "X", true, GUIEditor.window[1])
GUIEditor.button[6]:setProperty("NormalTextColour", "FFAAAAAA")

GUIEditor.combobox[2] = GuiComboBox(0.88, 0.03, 0.10, 0.11, "Idioma", true, GUIEditor.window[1])
GUIEditor.combobox[2]:addItem("Español")
GUIEditor.combobox[2]:addItem("English")

GUIEditor.label[2] = GuiLabel(0.73, 0.89, 0.20, 0.05, "", true, GUIEditor.window[1])
GUIEditor.label[2]:setHorizontalAlign("center", true)

GUIEditor.label[3] = GuiLabel(0.29, 0.95, 0.07, 0.03, "ClawSuit", true, GUIEditor.window[1])
GUIEditor.label[3]:setFont("clear-normal")

ChangeIdioma = {GUIEditor.edit[1], GUIEditor.button[1], GUIEditor.button[2], GUIEditor.button[3], GUIEditor.button[4], GUIEditor.label[1], GUIEditor.button[5], GUIEditor.combobox[2]}

SQL.showDbEditor = function()
    if not GUIEditor.window[1]:getVisible() then
        GUIEditor.window[1]:setVisible(true)
        showCursor(true)
        guiSetInputEnabled( true )
        addEventHandler( "onClientKey", getRootElement(), showMouse )
    end
end

addEventHandler ( "onClientGUIComboBoxAccepted", guiRoot,
    function ( comboBox )
        if ( comboBox == GUIEditor.combobox[2] ) then
            Idioma_Actual = comboBox:getItemText(comboBox.selected)
            for i, guiElement in ipairs(ChangeIdioma) do
                local cambio = IDIOMA[Idioma_Actual][i]
                if (i == 6) then
                    local old = guiElement.text:sub(guiElement.text:find(': ')+1)
                    guiElement.text = cambio..old
                elseif (i==1) then
                    if (GUIEditor.edit[1].text:find('Escriba la ruta de la base de datos')) or (GUIEditor.edit[1].text:find('Enter the path of the database')) then
                        guiElement.text = cambio
                    end
                else
                    guiElement.text = cambio
                end
            end
        elseif ( comboBox == GUIEditor.combobox[1] ) then
            local text = comboBox:getItemText(comboBox.selected)
            if (text) then
                triggerServerEvent('SQL.getDB', resourceRoot, GUIEditor.edit[1].text, text)
            end
        end
    end
)

SQL.onClientGUIClick = function(b,s)
    if (b == 'left') and (s == 'up') then
        if (source == GUIEditor.edit[1]) then
            if (GUIEditor.edit[1].text:find('Escriba la ruta de la base de datos')) or (GUIEditor.edit[1].text:find('Enter the path of the database')) then
                GUIEditor.edit[1].text = ''
            end
        elseif (source == GUIEditor.button[6]) then
            GUIEditor.window[1]:setVisible(false)
            showCursor(false)
            guiSetInputEnabled( false )
            removeEventHandler( "onClientKey", getRootElement(), showMouse )
        elseif (source == GUIEditor.button[1]) then
            local text = GUIEditor.edit[1].text
            if #text > 0 then
                triggerServerEvent('SQL.getTablas', resourceRoot, text)
            end
        elseif (source == GUIEditor.staticimage[1]) then
            if (GUIEditor.combobox[1]:getItemText(GUIEditor.combobox[1].selected) or '') ~= 'Tablas:' then
                triggerServerEvent('SQL.getDB', resourceRoot, GUIEditor.edit[1].text, GUIEditor.combobox[1]:getItemText(GUIEditor.combobox[1].selected), 5)
            end
        elseif (source == GUIEditor.button[2]) then -- nuevo

            local nulls = {GUIEditor.gridlist[1]:getRowCount()+1}

            for c = 2, GUIEditor.gridlist[1]:getColumnCount() do
                nulls[c] = ''
            end

            GUIEditor.gridlist[1]:addRow(unpack(nulls))

        elseif (source == GUIEditor.button[3]) then -- borrar

            local rowS = GUIEditor.gridlist[1]:getSelectedItem()

            local index = 0
            local temp = {}

            for r = 0, GUIEditor.gridlist[1]:getRowCount()-1 do
                temp[r+1] = temp[r+1] or {}
                for c = 2, GUIEditor.gridlist[1]:getColumnCount() do
                    temp[r+1][GUIEditor.gridlist[1]:getColumnTitle(c)] = GUIEditor.gridlist[1]:getItemText(r,c)
                end
            end

            GUIEditor.gridlist[1]:clear()

            for i,v in ipairs(temp) do
                if rowS ~= i-1 then
                    index = index + 1
                    local row = GUIEditor.gridlist[1]:addRow(index)
                    for ii, vv in pairs(v) do
                        local ic = getColumnIndex(GUIEditor.gridlist[1], ii)
                        GUIEditor.gridlist[1]:setItemText(row, ic, vv, false, false)
                    end
                end
            end
            SQL.showNotice(4)

        elseif (source == GUIEditor.button[4]) then -- aplicar
            if rowC and colC then
                local text = GUIEditor.memo[1].text
                GUIEditor.gridlist[1]:setItemText(rowC, colC, text:sub(1,#text-1), false, false)
            end

        elseif (source == GUIEditor.button[5]) then

            local temp = {}

            for r = 0, GUIEditor.gridlist[1]:getRowCount()-1 do
                temp[r+1] = temp[r+1] or {}
                for c = 2, GUIEditor.gridlist[1]:getColumnCount() do
                    table.insert(temp[r+1],GUIEditor.gridlist[1]:getItemText(r,c))
                end
            end

            triggerServerEvent('SQL.saveChanges', resourceRoot, GUIEditor.edit[1].text, GUIEditor.combobox[1]:getItemText(GUIEditor.combobox[1].selected), temp)
        end
    else
        return
    end
end

SQL.onClientGUIDoubleClick = function(b,s)
    if (b == 'left') and (s == 'up') then
        if (source == GUIEditor.gridlist[1]) then
            local row, col = source:getSelectedItem()
            if row ~= -1 and col >= 2 then
                rowC, colC = row, col
			    local text = source:getItemText(row, col)
                GUIEditor.memo[1].text = text
                local _typ = getTextType(text)
                GUIEditor.label[1].text = IDIOMA[Idioma_Actual][6].._typ
            end
        end
    end
end

SQL.getTablas = function(tablas)
    if #tablas > 0 then
        GUIEditor.combobox[1]:clear()
        for i, t in ipairs(tablas) do
            GUIEditor.combobox[1]:addItem(t)
        end
    end
end

SQL.getDB = function(dbc, db)
    newGridList()

    local columns = {}
    for _, column in ipairs(dbc) do

        local size = 0.2
        if #column > 6 and #column < 11 then
            size = size + tonumber('0.0'..#column)
        elseif #column > 11 then
            size = size + tonumber('0.'..#column)
        end

        GUIEditor.gridlist[1]:addColumn(column, size)
        table.insert(columns, column)
    end

    for i, v in ipairs(db) do
        local row = GUIEditor.gridlist[1]:addRow(''..i)
        for _, c in ipairs(columns) do
            local index = getColumnIndex(GUIEditor.gridlist[1], c)
            if index then
                GUIEditor.gridlist[1]:setItemText(row, index,tostring(v[c]), false, false)
            end
        end
    end

end

SQL.showNotice = function(_type)
    if notiT and notiT:isValid() then
        notiT:destroy()
    end
    local message = Avisos[Idioma_Actual][_type]
    GUIEditor.label[2]:setColor(unpack((_type == 2 and {255,0,0} or _type == 6 and {255,0,0} or {0,255,0})))
    GUIEditor.label[2].text = message
    notiT = Timer(guiSetText, 4000, 1, GUIEditor.label[2], '')
end




function showMouse(b,s)
    if b == 'mouse2' and s then
        if GUIEditor.window[1]:getVisible() then
            local bool = not isCursorShowing( )
            showCursor(bool)
            guiSetInputEnabled( bool )
        end
    end
end



SQL.addEvents = function()
    for i = 1, #SQL.events do
        if SQL.events[i]:find('SQL.') then
            addEvent(SQL.events[i], true)
            addEventHandler(SQL.events[i], root, SQL[SQL.events[i]:sub(5)])
        else
            addEventHandler(SQL.events[i], root, SQL[SQL.events[i]])
        end
    end
end

SQL.resourceStart = function()
    SQL.addEvents()
end
addEventHandler("onClientResourceStart", resourceRoot, SQL.resourceStart)


function newGridList()
    GUIEditor.gridlist[1]:destroy()
    GUIEditor.gridlist[1] = GuiGridList(0.01, 0.14, 0.64, 0.80, true, GUIEditor.window[1])
    GUIEditor.gridlist[1]:addColumn("", 0.07)
    GUIEditor.gridlist[1]:setSelectionMode(2)
    GUIEditor.gridlist[1]:setSortingEnabled(false)
end
