-- Developer: ClawSuit
-- Discord: ♱ ᑕᒪᗩᗯᔕᑌIT ♱#0284

--// Data base editor:
--|| Configuraciones + funciones utiles
--\\------------------------------------

Idioma_Actual = 'Español'

IDIOMA = {
    ['Español'] = {
        [1] = 'Escriba la ruta de la base de datos',
        [2] = 'Cargar DB',
        [3] = 'Nuevo Registro',
        [4] = 'Borrar Registro',
        [5] = 'Aplicar',
        [6] = 'Tipo de dato actualmente en la celda: ',
        [7] = 'Guardar Cambios',
        [8] = 'Idioma',
    },
    ['English'] = {
        [1] = 'Enter the path of the database',
        [2] = 'Load DB',
        [3] = 'New Registration',
        [4] = 'Clear log',
        [5] = 'Apply',
        [6] = 'Data type currently in the cell: ',
        [7] = 'Save Changes',
        [8] = 'Language',
    }
}

Avisos = {
    ['Español'] = {
        [1] = 'Los cambios se guardaron con éxito',
        [2] = 'La ruta del archivo es incorrecta',
        [3] = '¡Base de datos cargada!',
        [4] = 'Registro borrado',
        [5] = 'La lista se refresco',
        [6] = 'El nombre de la tabla no se encuentra en la base de datos'
    },
    ['English'] = {
        [1] = 'Changes saved successfully',
        [2] = 'The file path is wrong',
        [3] = 'Database loaded',
        [4] = 'Record deleted',
        [5] = 'The updated list',
        [6] = 'Table name not found in the database',
    }
}


function getColumnIndex(list, column)
    for i = 1, list:getColumnCount() do
        if list:getColumnTitle(i) == column then
            return i
        end
    end
    return false
end

function getTextType(text)
    local type = ''
    if fromJSON(text) then
        type = 'JSON / Table'
    elseif text:find('%a+') then
        type = 'String / Texto'
    elseif tonumber(text) then
        type = 'Number / Numero'
    elseif text:find('%w+') then
        type = 'Texto / Numero'
    end
    return type
end
