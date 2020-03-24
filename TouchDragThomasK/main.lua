-- Title: TouchAndDrag
-- Name: Thomas Kushner
-- Course: ICS2O
-- This programm has 2 images that can be dragged around
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create local variables
local backgroundImage = display.newImageRect("Images/sky.png", 2048, 1536)
local Tyler = display.newImageRect("Images/Tyler.png", 250, 150)
local tylerHeight = Tyler.height
local tylerWidth = Tyler.width 

local Igor = display.newImageRect("Images/IGOR.png", 250, 150)
local igorHeight = Igor.height
local igorWidth = Igor.width 

local Krabs = display.newImageRect("Images/Krabs.png", 250, 150)
local krabsHeight = Krabs.height
local krabsWidth = Krabs.width

-- my boolean variables are to keep track of which object I touch first
local alreadyTouchedTyler = false
local alreadyTouchedIgor = false
local alreadyTouchesKrabs = false

-- set the initial (x,y) position of the objects
Tyler.x = 300
Tyler.y = 200

Igor.x = 400
Igor.y = 350

Krabs.x = 650
Krabs.y = 500

-- Function: TylerListener
-- Input: touch listener
-- Output: none
-- Description: when tyler is touched, move him
local function TylerListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedIgor == false) and (alreadyTouchesKrabs== false) then
			alreadyTouchedTyler = true
		end	
    end 

    if ( (touch.phase == "moved") and (alreadyTouchedTyler == true) ) then
	   Tyler.x = touch.x 
	   Tyler.y = touch.y
    end 

    if (touch.phase == "ended") then
    	alreadyTouchedTyler = false
    	alreadyTouchedIgor = false
    	alreadyTouchesKrabs = false
    end
end

-- add the listeners to each object
Tyler: addEventListener("touch", TylerListener)

-- Function:IgorListener
-- Input: touch listener
-- Output: none
-- Description: when igor is touched, move him
local function IgorListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedTyler == false) and (alreadyTouchesKrabs== false) then
			alreadyTouchedIgor = true
		end	
    end 

    if ( (touch.phase == "moved") and (alreadyTouchedIgor == true) ) then
	   Igor.x = touch.x 
	   Igor.y = touch.y
    end 

    if (touch.phase == "ended") then
    	alreadyTouchedTyler = false
    	alreadyTouchedIgor = false
    	alreadyTouchesKrabs = false
    end
end

-- add the listeners to each object
Igor: addEventListener("touch", IgorListener)

-- Function:KrabsListener
-- Input: touch listener
-- Output: none
-- Description: when krabs is touched, move him
local function KrabsListener(touch)
	if (touch.phase == "began") then
		if (alreadyTouchedTyler == false) and (alreadyTouchesIgor== false) then
			alreadyTouchedKrabs = true
		end	
    end 

    if ( (touch.phase == "moved") and (alreadyTouchedKrabs == true) ) then
	   Krabs.x = touch.x 
	   Krabs.y = touch.y
    end 

    if (touch.phase == "ended") then
    	alreadyTouchedTyler = false
    	alreadyTouchedIgor = false
    	alreadyTouchedKrabs = false
    end
end

-- add the listeners to each object
Krabs: addEventListener("touch", KrabsListener)
