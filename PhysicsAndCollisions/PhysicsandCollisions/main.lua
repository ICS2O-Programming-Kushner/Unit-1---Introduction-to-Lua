-- PhysicsandCollisions
-- Thomas Kushner
-- ICS2O
-------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set background colour
display.setDefault("background", 255/255, 255/255, 255/255)

-- load physics
local physics = require("physics")

-- start physics
physics.start()


-----------------------------------------------------------------------------------------
-- Objects
-----------------------------------------------------------------------------------------

--Ground
local ground = display.newImage("Images/ground.png", 0, 0)

	
	ground.width = display.contentWidth

	-- set the x and y 
	ground.x = display.contentWidth/2
	ground.y = display.contentHeight* 96/100

	-- add to physics
	physics.addBody(ground, "static", {friction = 0.5, bounce = 0.3} )


-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- create the firat ball
local function FirstBall()
	-- creating first ball
	local ball1 = display.newImage("Images/ball.png", 100, 300)

	ball1.width = 75
	ball1.height = 75

	-- add to physics
	physics.addBody(ball1, {density = 5.0, friction = 0.1, bounce = 1, radius = 35})
end

local function SecondBall()
	--create the second ball
	local ball2 = display.newImage("Images/ball.png", 600, 200)

	ball2.width = 25
	ball2.height = 25

	-- add to physics
	physics.addBody(ball2, {density = 1.0, friction = 4, bounce = 0.3, radius = 12.5})
end

local function ThirdBall()
	--create the third ball
	local ball3 = display.newImage("Images/ball.png", 700, 100)

	ball3.width = 8
	ball3.height = 8

	-- add to physics
	physics.addBody(ball3, {density = 2.0, friction = 0.5, bounce = 0.7, radius = 4})
end

local function FourthBall()
	--create the fourth ball
	local ball4 = display.newImage("Images/ball.png", 500, 300)

	ball4.width = 150
	ball4.height = 150

	-- add to physics
	physics.addBody(ball4, {density = 5.0, friction = 0.5, bounce = 0.8, radius = 75})
end
-----------------------------------------------------------------------------------------
-- TIMER DELAYS - call each function after the given millisecond
-----------------------------------------------------------------------------------------
timer.performWithDelay( 0, FirstBall )
timer.performWithDelay( 500, SecondBall )
timer.performWithDelay( 1000, ThirdBall )
timer.performWithDelay( 1500, FourthBall )