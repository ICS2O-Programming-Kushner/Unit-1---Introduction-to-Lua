-- Title: Buttons
-- Name: Thomas Kushner
-- Course: ICS2O/3C
-- This program does something when I click on the button

-- set background colour
display.setDefault ("background", 255/255, 255/255, 255/255)

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, et its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = false

--  create red button, set 