-- Title: Whack a Mole 
-- Name: Thomas Kushner
-- Course: ICS2O
----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 255/255, 255/255, 255/255)

local score = 0

local scoreText = display.newText( "Score: 0", 200, 100, nil, 50 )
	scoreText:setTextColor(0,1,1)

-- create our mole
local mole = display.newImage( "Images/mole.png", 0, 0 ) 

    mole.x = 500
    mole.y = 500

    mole.width = 270
	mole.height = 180

	mole.isVisible = false

