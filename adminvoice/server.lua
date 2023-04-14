local allowedACL =
{
	[aclGetGroup("Admin")] = true,
	[aclGetGroup("Moderator")] = true,
}

function adminSpeaker(source, command, ...)
	for group,_ in pairs(allowedACL) do
		local account = getPlayerAccount(source)
		local name = getAccountName(account)
			if isObjectInACLGroup("user."..name,group) then
			local txt = table.concat({...}, " ")
		triggerClientEvent("client_textToSpeech", source, txt)
	end
  end
end
addCommandHandler("adminspeak", adminSpeaker)


-- usage: /customadminspeak [lang] [text]
function adminLangSpeak(source, command, lang, ...)
	for group,_ in pairs(allowedACL) do
		local account = getPlayerAccount(source)
		local name = getAccountName(account)
			if isObjectInACLGroup("user."..name,group) then
			local txt = table.concat({...}, " ")
		triggerClientEvent("client_textToSpeech", source, txt, lang)
	end
  end
end
addCommandHandler("adminkonus", adminLangSpeak)