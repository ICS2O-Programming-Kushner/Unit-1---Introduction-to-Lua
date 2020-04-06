-- Title AnimatingImages
-- Name Thomas Kushner
-- Course ICS2O3C
-- This program displays three images shrinkinggrowing, fading out
-- And moving diagonally
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- create background 
local backgroundImage = display.newImageRect(ImagesFelix.png, 2048, 1536)

-- create the characters
local bigSmoke = display.newImageRect(Imagessmoke.png, 200, 200)
local panzer = display.newImageRect(Imagespanzer.png, 400, 400)
local kong = display.newImageRect(Imageskong.png, 600, 500)

-- create the variable that allows the object to shrinkgrow
local pixels

-- set the intial (x,y) position of bigSmoke
bigSmoke.x = 800
bigSmoke.y = display.contentHeight1


-- set the initial (x,y) position of panzer
panzer.x = 350
panzer.y = display.contentHeight1.7



-- set the initial (x,y) position of kong
kong.x = 100
kong.y = display.contentHeight5


-- global variables
scrollSpeed = 2

-- make big smoke move 
transition.to(bigSmoke, {x=500, y=200})


-- Function ShrinkKong
-- Input this function accepts an event listener
-- Output none
-- Description This makes the object shrink
local function ShrinkKong(event)
	-- add the scroll speed to the x-value of the ship
	kong.x = kong.x + scrollSpeed
	-- change the height of kong so that he shrinks
	kong.xScale =
	kong.xScale - 0.01
	kong.yScale = 
	kong.yScale - 0.01
    -- change the transparency of kong every time it moves it fades in
    kong.alpha = kong.alpha - 0.01

end

-- ShrinkKong will be called over and over again
RuntimeaddEventListener(enterFrame, ShrinkKong)

-- Function FadePanzer
-- Input this function accepts an event listener
-- Output none
-- Description This changes the transparency of an object
local function FadePanzer(event)
	-- change the transparency of the object
	panzer.alpha = panzer.alpha - 0.01
end

RuntimeaddEventListener(enterFrame, FadePanzer)


-- create local variables
local squid = display.newImageRect(Imagessquid.png, 250, 250)
local fortnite = display.newImageRect(Imagesdefaultskin.png, 200, 200)

local text  
local textSize = 50

-- set the (x,y) position of squid
squid.x = 700
squid.y = display.contentHeight4

-- set the (x,y) position of fortnite
fortnite.x = 600
fortnite.y = display.contentHeight2

-- display the text
display.newText(When the annoying kid starts to talk, 500, 700, nil, textSize)

-- Function MoveSquid
-- Input this function accepts an event listener
-- Output none
-- Description this function adds the scroll speed to the x-value of squid
local function MoveSquid(event)
	-- add the scroll speed to the x-value of squid
	squid.x = squid.x + scrollSpeed
	
end

RuntimeaddEventListener(enterFrame, MoveSquid)

-- Function MoveDefault
-- Input this function accepts an event listener
-- Output none
-- Description this function adds the scroll speed to the x-value of default
local function MoveDefault(Event)
	-- add the scrollSpeed to the x-value of default
	fortnite.x = fortnite.x - scrollSpeed
	-- change the tranparency so that fades out
	fortnite.alpha = fortnite.alpha - 0.0001
end

RuntimeaddEventListener(enterFrame, MoveDefault)