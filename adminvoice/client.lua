function textToSpeech(txt,lang)
	if lang then
		playSound("http://translate.google.com/translate_tts?tl="..lang.."&q="..txt.."&client=tw-ob", false)
	else
		playSound("http://translate.google.com/translate_tts?tl=en&q="..txt.."&client=tw-ob", false)
	end
end
addEvent("client_textToSpeech" , true )
addEventHandler("client_textToSpeech" , getRootElement(), textToSpeech)