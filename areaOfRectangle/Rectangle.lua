--Title Local Variables
-- Name: Thomas Kushner
--Course: ICS20/3C
--This program shows the area of a rectangle
-------------------------------------------------------------------------------------
--rectangle

-- Create LocalVariable
local areaText
local textSize = 70
local theRectangle
local widthRectangle = 300
local heightRectangle = 150
local areaRectangle

--set the background of my screen. Remember that colours are between 0 and 1
display.setDefault("background", 17/255, 0/255, 255/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen.
theRectangle = display.newRect(0, 0,widthOfRectangle)