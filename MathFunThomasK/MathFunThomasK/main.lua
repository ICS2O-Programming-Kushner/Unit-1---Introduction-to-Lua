-- Name: Thomas Kushner
-- Course: ICS2OR
-- Title: Math Fun
-- main.lua
-- This program displays a series of math questions
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background 
display.setDefault("background", 12/255, 23/255, 155/255)
------------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------------------
-- create local variables 
local questionObject 
local correctObject 
local numericField 
local randomOperator = math.random(1,2)
local randomNumber1
local randomNumber2 
local userAnswer 
local correctAnswer
local inCorrectObject 
local textSize = 50
local incorrect = 0
local actualAnswerText 

--------------------------------------------------------------------------------------------------------
-- SOUNDS
----------------------------------------------------------------------------------------------------------
-- create the Sounds 
local wrongSound = audio.loadSound( "Sounds/wrongSound.mp3" ) -- Setting a variable to an mp3 file
local wrongSoundChannel

local correctSound = audio.loadSound( "Sounds/correctSound.mp3" ) -- Setting a variable to an mp3 file
local correctSoundChannel

----------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1 and 2 
	randomOperator = math.random(1,2)

	-- generate 2 random numbers
	randomNumber1 = math.random(0, 4)
	randomNumber2 = math.random(0, 4)

	-- if the random operator is 1, then do addition 
	if (randomOperator == 1) then 

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operatior is 2, do subtraction 
	elseif (randomOperator == 2) then 
		
		-- calculate the correct answer 
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object 
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = " 

    -- if the random operator is 3, do multiplication
    elseif (randomOperator == 3) then
        
        -- calculate the correct answer
        correctAnswer = randomNumber1 * randomNumber2

        -- create question in text object
        questionObject.text = randomNumber1 .. " * " .. randomNumber2
   
    -- if the random operator is 4, do division
    elseif (randomOperator == 3) then
        
        -- calculate the correct answer
        correctAnswer = randomNumber1 / randomNumber2

        -- create question in text object
        questionObject.text = randomNumber1 .. " / " .. randomNumber2

	end
end 

local function HideCorrect() 
	correctObject.isVisible = false
	AskQuestion()
end

local function HideInCorrect()
	inCorrectObject.isVisible = false 
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numericField"
	if ( event.phase == "began" ) then 

		-- clear text field 
		event.target.text = ""

	elseif event.phase == "submitted" then 

		-- when the answer is submitted(enter key is pressed) set user input to user's answer 
		userAnswer = tonumber(event.target.text)

		-- if the users answer and correct answer are the same: 
		if (userAnswer == correctAnswer) then 
			event.target.text = ""
			correctObject.isVisible = true 
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2100, HideCorrect)
		else
			event.target.text = ""					
			inCorrectObject.isVisible = true
			wrongSoundChannel = audio.play(wrongSound)
			timer.performWithDelay(2100, HideInCorrect)
		end
	end
end

-------------------------------------------------------------------------------------
-- OBJECT CREATION 
-------------------------------------------------------------------------------------

-- displays a question and sets the colour 
questionObject = display.newText( "", 210, 70, nil, 50, Arial, textSize )
questionObject:setTextColor(250/255, 209/255, 243/255)

-- create the correct text object and make it visible 
correctObject = display.newText( "RIGHT! looks like we got a mathematician", 500, 150, nil, 50 )
correctObject:setTextColor(186/255, 188/255, 186/255)
correctObject.isVisible = false 

-- create the incorrect text obejct and make it visible 
inCorrectObject = display.newText("Wrong. Some mathematician you are", 500, 150, nil, 50 )
inCorrectObject:setTextColor(209/255, 209/255, 209/255)
inCorrectObject.isVisible = false 

-- create numeric field 
numericField = native.newTextField( 370, 70, 150, 70 )
numericField.inputType = "number"

-- add the event listener fot the numeric field 
numericField:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS 
------------------------------------------------------------------------------------------------

-- call the function to ask the question 
AskQuestion()
