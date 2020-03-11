--Title Local Variables
-- Name: Thomas Kushner
--Course: ICS20/3C
--This program shows the area of a rectangle
-------------------------------------------------------------------------------------
--rectangle

-- Create LocalVariable
local areaText
local textSize = 50
local theRectangle
local widthRectangle = 300
local heightRectangle = 250
local areaRectangle

--set the background of my screen. Remember that colours are between 0 and 1
display.setDefault("background", 17/255, 0/255, 255/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and the height of the screen and set its (x,y) position
theRectangle = display.newRect(0, 0, widthRectangle, heightRectangle)

-- anchor the rectangle in the top left corner of the screen and its (x,y) position
theRectangle.anchorX = 0
theRectangle.anchorY = 0
theRectangle.x = 20
theRectangle.y = 20

-- set the width of the border
theRectangle.strokeWidth = 20

-- set the colour of the border
theRectangle:setFillColor(0, 1, 0)

-- set the color of the rectangle
theRectangle:setStrokeColor(0.7, 0.3, 0.5)

-- set the colour of the border
theRectangle:setStrokeColor(0, 5, 6)

-- calculate the area
areaRectangle = widthRectangle * heightRectangle

-- write the area on the screen. Take into consideration the size on the font when positioning it on the screen
areaText = display.newText("The area of this rectangle with a width of \n"..
	widthRectangle .. " and a height of" .. heightRectangle .. "is" .. 
	areaRectangle .. "pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2
