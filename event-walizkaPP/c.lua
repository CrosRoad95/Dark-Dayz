local sw, sh = guiGetScreenSize() 

WalizkaGui = {}

WalizkaGui[1] = guiCreateStaticImage( 325/1024*sw, 657/768*sh, 374/1024*sw, 50/768*sh, "images/bg.png", false )
guiSetAlpha(WalizkaGui[1], 0.60000002384186)
guiSetVisible( WalizkaGui[1], false )

WalizkaGui[2] = guiCreateStaticImage( 342/1024*sw, 662/768*sh, 27/1024*sw, 36/768*sh, "images/case.png", false )
guiSetVisible( WalizkaGui[2], false )

WalizkaGui[3] = guiCreateLabel( 283/1024*sw, 659/768*sh, 509/1024*sw, 39/768*sh, "", false )
guiLabelSetVerticalAlign( WalizkaGui[3], "center" )
guiLabelSetHorizontalAlign( WalizkaGui[3], "center", false )
guiSetFont( WalizkaGui[3], "clear-normal" )
guiSetVisible( WalizkaGui[3], false )


function ShowCaseGui( message )
	guiSetText( WalizkaGui[3], message )
	guiSetVisible( WalizkaGui[1], true )
	guiSetVisible( WalizkaGui[2], true )
	guiSetVisible( WalizkaGui[3], true )
end
addEvent("ShowCaseGui", true)
addEventHandler("ShowCaseGui", getRootElement(), ShowCaseGui)

function HideCaseGui( )
	guiSetVisible( WalizkaGui[1], false )
	guiSetVisible( WalizkaGui[2], false )
	guiSetVisible( WalizkaGui[3], false )
end
addEvent("HideCaseGui", true)
addEventHandler("HideCaseGui", getRootElement(), HideCaseGui)