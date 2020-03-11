-- Title: TouchAndDrag
-- Name: Thomas Kushner
-- Course: ICS2O
-- This programm has 2 images that can be dragged around
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault ("background", 0/255, 100/255, 0/255)

local waluigi = display.newImageRect ("Images/t-pose.png", 200, 200)
local filthyFrank = display.newImageRect ("Images/franku.png", 200, 200)
local waluigiWidth = waluigi.waluigiWidth
local waluigiHeight = waluigi.waluigiHeight
local frankWidth = frank.frankWidth
local frankHeight = frank.frankHeight