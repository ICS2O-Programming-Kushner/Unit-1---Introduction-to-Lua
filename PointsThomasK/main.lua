-- Title: Points
-- Name: Thomas Kushner
-- main.lua
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 23/255, 130/255, 232/255)

------------------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------------------------------------------------------------

-- create the local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local points = 0
local incorrect = 0
local textSize = 50
local gameOverText = "You Lose"
local youWinText = "Winner"
local actualAnswerText
------------------------------------------------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a maximum and a mininum number
	randomNumber1 = math.random(0, 8)
	randomNumber2 = math.random(0, 8)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="

end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideInCorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function HideActualAnswertext()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener()
    -- User begins editing numericField
	if ( event.target.text == "began" ) then
   
    -- clear the text field
    event.target.text = ""
    
    elseif ( event.phase == "submitted" ) then
         
    	-- when the answer is submitted (enter key is pressed) set user input to user's answer
    	userAnswer = tonumber(event.target.text)

    	-- if the user's answer is submitted and the correct answer are the same:
    	if (userAnswer == correctAnswer) then
    		event.target.text = ""
	        correctObject.isVisible = true
	        timer.performwithDelay(2100, HideCorrect)
	        -- give a point if the user is correct
	        points = points + 1
	        -- display it 
	        pointaText.text = "Points = " .. points

	        if (points == 6) then
	        	correctObject.isVisible = false
	        	pointsText.isVisible = false
	        	questionObject.isVisible = false
	        	numericTextField.isVisible = false
	        	incorrectText.isVisible = false
	        	youWinText = display.newText(youWinText, 512, 384, nil, 75)
	        	youWinText:setTextColor(255/255, 255/255, 255/255)
	        end 	
       
        else 
        	event.target.text = ""
        	incorrectText.isVisible = true
        	timer.performwithDelay(2500, HideCorrect)
        	incorrect = incorrect + 1
        	incorrectText.text = "Incorrect = " .. incorrect
        	actualAnswerText.isVisible = true
        	timer.performwithDelay(2500, HideActualAnswertext)
        	actualAnswerText = display.newText("The correct answer is" .. correctAnswer, 280, 205, nil, 30)
        	actualAnswerText: setTextColor(255/255, 255/255, 255/255)

        	if (incorrect == 3) then
        		incorrectObject.isVisible = false
        		numericField.isVisible = false
        		questionObject.isVisible = false
        		incorrectText.isVisible = false
        		pointsText.isVisible = false
        		actualAnswerText.isVisible = false
        		gameOverText = display.newText(gameOverText, 512, 384, nil, 75)
        		gameOverText:setTextColor(255/255, 255/255, 255/255)
            end 
        end 
    end 
end
        
        	
-------------------------------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText("", 210, 70, nil, 50, Arial, textSize)    
questionObject:setTextColor(255/255, 255/255, 255/255)

-- create the correct text object and make it appear
correctObject = display.newText("Correct!!", 230, 150, nil, 50)
correctObject:setTextColor(255/255, 255/255, 255/255)
correctObject.isVisible = false

-- create incorrect text object and make it visible
incorrectObject = display.newText("wrong", 230, 150, nil, 50)
incorrectObject:setTextColor(255/255, 255/255, 255/255)
incorrectObject.isVisible = false

-- create the numeric field
numericField = native.newTextField( 370, 70, 150, 70 )
numericField.inputType = "number"

-- add an event listener for our numeric field
numericField:addEventListener( "userinput", NumericFieldListener)

-- display the amount of points as a text object
pointsText = display.newText("Points= 1" .. points, 850, 70, nil, 50)
pointsText:setTextColor(0/255, 0/255, 0/255)

-- Incorrect text
incorrectText = display.newText("Incorrect = 0" .. incorrect, 400, 745, nil, 100)
incorrectText:setTextColor(0/255, 0/255, 0/255)

-------------------------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
-------------------------------------------------------------------------------------------------------------------------

AskQuestion()               