-- Title: MovingObjects
-- Name: Thomas Kushner
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen fades in and then makes it fade out.
-- I added a second object that that moves in a different direction fades out
-- and grows in size.
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 5

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536 )

-- character image with width and height
 local beetleship = display.newImageRect("Imaged/beetleship.png", 250, 250)

 -- set the image to be transparent
 beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- Function: MoveShip
-- Input: this fuction accepts an event listener
-- Output: none
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	-- change the transparency of the ship every time it moves so that it fades out
	 beetleship.x = beetleship.x + scrollSpeed
     beetleship.alpha = beetleship.alpha + 0.03
	
end  

--MoveShip will be calledover and over again
Runtime: addEventListener("enterFrame", MoveShip)

-- character image with width and height