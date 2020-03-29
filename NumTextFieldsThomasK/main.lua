-----------------------------------------------------------------------------------------
-- Thomas Kushner
-- main.lua
-- Course: ICS2O
-- This program asks the user an addition question. The user enters their answer
-- a numeric text field. If they answer the question correctly, the word "Correct!" is
-- displayed. Otherwise, "incorrect" is displayed
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 17/255, 187/255, 45/255)

---------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
----------------------------------------------------------------------------------------------------

-- create the local variables
local correctObject
local incorrectObject
local questionObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local checkmark
local redX

------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random number between a max and a min number
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber1

	-- create the question in the text object 
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
    AskQuestion()
end		

local function NumericFieldListener (event)
	-- User begins editing numericField
	if ( event.target.text == "began" ) then

    
    elseif ( event.phase == "submitted" ) then
         
    	-- when the answer is submitted (enter key is pressed) set user input to user's answer
    	userAnswer = tonumber(event.target.text)

    	-- if the user's answer is submitted and the correct answer are the same:
    	if (userAnswer == correctAnswer) then
    		correctObject.isVisible = true
	        incorrectObject.isVisible = false
	        checkmark.isVisible = true
	        redX.isVisible = false
	        timer.performWithDelay(3000, HideCorrect)
	    end

	    -- clear the text field
	    event.target.text = ""
    end
end 

---------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText("", 300, 400, nil, 80)
questionObject:setTextColor(255/255, 255/255, 255/255)

-- create the correct text object and make it invisible
correctObject = display.newText("Correct!", display.contentWidth*1/4, display.contentHeight/2, nil, 80)
correctObject:setTextColor(0/255, 100/255, 255/255)

-- create the incorrect text object and make it invisible
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight*2/3, 200, 100)
numericFieldinputType= "number"

-- create the incorrect text object
incorrectObject = display.newText("Incorrect. Try another one", display.contentWidth*1/3, display.contentHeight*1/3, nil, 50)
incorrectObject:setTextColor(2/255, 60/255, 255/255)

-- create the checkmark
checkmark = display.newImageRect("Images/checkmark.png", 198, 96)
checkmark.x = 500
checkmark.y = 600
checkmark.isVisible = false

-- create redX
redX = display.newImageRect("Images/redX.png", 198, 96)
redX.x = 500
redX.y = 400
redX.isVisible = false

---------------------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
-------------------------------------------------------------------------------------------------------------------------

AskQuestion()
