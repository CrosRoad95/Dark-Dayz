Log = { }
local cover = "================================================="

function Log:Time( )
    local _time = getRealTime ( )
    local _second = _time.second
    local _minute = _time.minute
    local _hour = _time.hour
    local _date = _time.monthday
    local _month = getMonthName ( _time.month + 1 )
    local _year = _time.year + 1900
    return
        _year, _month, _date, _hour, _minute, _second
end

function saveLogServer( _str, _whatLogsPath, _filePathChat )

    local _year, _month, _date, _hour, _minute, _second = Log:Time ( )
    local filePath = "logs_".. _whatLogsPath .."/".. _filePathChat .."/" .. _year .. "/" .. _month .. "/" .. _date .. ".log"
    
    if not ( fileExists ( filePath ) ) then
        fileCreate( filePath )
        local file = fileOpen ( filePath )
        fileWrite( file, cover .. "\n= Logi wygenerowane dnia " .. _date .. " " .. _month .. ", " .. _year .. " = \n" .. cover .. "\n" )
        fileClose( file )
    end
    local file = fileOpen( filePath )
    fileSetPos( file, fileGetSize( file ) )
    local _str = tostring ( _str )
    fileWrite( file, "\n[" .. _hour .. ":" .. _minute .. ":" .. _second .. "] " .. _str )
    fileFlush( file )
    fileClose( file )
	
end

months = { "Styczen", "Luty", "Marzec", "Kwiecien", "Maj", "Czerwiec", "Lipiec", "Sierpien", "Wrzesien", "Pazdziernik", "Listopad", "Grudzien" }

function getMonthName( _month )
    return months[ _month ]
end