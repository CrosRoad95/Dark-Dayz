local FontTable = {}
local dgsFontTable = {}
local DGS = exports.dgs

function GetFont(name, size)
 

    if not FontTable[name..""..size] then
        FontTable[name..""..size] = dxCreateFont(name..".ttf", size, false, "cleartype")
    end

    return FontTable[name..""..size] or "default";
end

function dgsGetFontFunc(name, size)
 

    if not dgsFontTable[name..""..size] then
        dgsFontTable[name..""..size] = DGS:dgsCreateFont(name..".ttf", size, false, "cleartype")
    end

    return dgsFontTable[name..""..size] or "default";
end