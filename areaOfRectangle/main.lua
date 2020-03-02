--Title Local Variables
-- Name: Thomas Kushner
--Course: ICS20/3C
--This program shows the area of a rectangle
-------------------------------------------------------------------------------------
--rectangle

-- Create LocalVariable
local areaText
local textSize = 69
local theRectangle
local widthRectangle = 300
local heightRectangle = 250
local areaRectangle

--set the background of my screen. Remember that colours are between 0 and 1
display.setDefault("background", 17/255, 0/255, 255/255)

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the 