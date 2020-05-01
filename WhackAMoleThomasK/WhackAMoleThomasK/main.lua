-----------------------------------------------------------------------------------------
-- Thomas Kusner
-- main.lua
--ICS2O
-----------------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)

display.setDefault("background", 247/255, 247/255, 247/251)

local score = 0

local scoreText = display.newText( "POINTS: 0", 200, 100, nil, 50 )
	scoreText:setTextColor(1,0,5)

-- create our mole
local mole = display.newImage( "Images/pickle.png", 0, 0 ) 

mole.x = 500
mole.y = 500

mole.width = 400
mole.height = 300

mole.isVisible = true

local function Hide()
	mole.isVisible = false
end

local function PopUp()

	mole.x = math.random( 0, 300)
	mole.y = math.random( 0, 400)

	mole.isVisible = true

	timer.performWithDelay(750, Hide)

	timer.performWithDelay(1500, PopUp)
end

local function PopUpDelay()
	timer.performWithDelay( 2000, PopUp )
end


local function GameStart()
	PopUpDelay()
end

local function Whacked(event)
	if (event.phase == "began") then
		audio.play(whacked)
		score = score + 1
		scoreText.text = "Score: " .. score
	end
end

mole:addEventListener( "touch", Whacked)

GameStart()