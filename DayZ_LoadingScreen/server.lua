
addEvent( "onLoadingPanelCheckLanguage", true )
addEventHandler( "onLoadingPanelCheckLanguage", resourceRoot, function(player)
    local country = exports.admin:getPlayerCountry(player)
    if not (country == "PL") then country = "ENG" end
    triggerClientEvent(client, "onServerCheckedLanguage", client, country)
end)