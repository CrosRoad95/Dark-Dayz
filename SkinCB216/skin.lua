function skintm1 (source) 
    local gangName = getElementData ( source, "gang" ) 
    if ( gangName and gangName == "CryBaby" ) then 
            setElementData( source,"skin",216) 
	setElementModel(source, 216)
      outputChatBox("Zalozyles skin grupowy!",source,0, 0, 255,true) 
        else 
     outputChatBox("Nie nalezysz do grupy!",source,255,0,0,true) 
    end 
    end 
    addCommandHandler ( "skincb", skintm1 ) 
