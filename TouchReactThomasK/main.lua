-- Title: TouchandDrag
-- Name: Thomas Kushner
-- Course: ICS2O/3C
-- This program does something when I click on the button

-- set background colour
display.setDefault ("background", 255/255, 255/255, 255/255)

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create local variables
local blueButton = display.newImageRect("Images/BlueButton.png", 200, 100)
blueButton.x = 500
blueButton.y = 400
blueButton.isVisible = true

-------------------------------------------------------------------------------------

local orangeButton = display.newImageRect("Images/orangeButton.png", 200, 100)
orangeButton.x = 500
orangeButton.y = 400
orangeButton.isVisible = false

------------------------------------------------------------------------------------

local textObject = display.newText("Clicked!", 0, 0, nil, 50)
textObject.x = 500
textObject.y = 500
textObject:setTextColor (0, 0, 0)
textObject.isVisible = false

------------------------------------------------------------------------------------

local checkmark = display.newImageRect("Images/checkmark.png", 200, 100)
checkmark.x = 500
checkmark.y = 600
checkmark.isVisible = false

--------------------------------------------------------------------------------------------

local correctSound = audio.loadSound("Sounds/correctSound.mp3")
local correctSoundChannel

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when the blue button is clicked, it will make
-- the text appear with the read button, and will make the blue button
-- disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		orangeButton.isVisible = true
		textObject.isVisible = true
		checkmark.isVisible = true
		correctSoundChannel = audio.play(correctSound)
    end

    if  (touch.phase == "ended") then
    	blueButton.isVisible = true
    	orangeButton.isVisible = false
    	textObject.isVisible = false
    	checkmark.isVisible = false
    end
end

blueButton:addEventListener("touch", BlueButtonListener)

-- Function: OrangeButtonListener
-- Input: touch listener
-- Output: none
-- Description: when orange button is released, it will go back to
-- the blue button
local function OrangeButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		orangeButton.isVisible = true
		textObject.isVisible = false
		checkmark.isVisible = false
    end

    if  (touch.phase == "ended") then
    	blueButton.isVisible = true
    	orangeButton.isVisible = false
    	textObject.isVisible = true
    	checkmark.isVisible = true
    end
end

orangeButton:addEventListener("touch", OrangeButtonListener)