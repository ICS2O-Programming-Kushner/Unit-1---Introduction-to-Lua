-- Assignment5
-- Thomas K 
-- ICS2O
-- This prorgram displays a series of math questions in which the user will answer. 
-- There are timers, lives, points, and a text field where the user answers
----------------------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar) 



------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------------

-- create local variables
local background = display.newImageRect("Images/sky.png", 2048, 1590)
local randomOperator
local questionObject
local correctObject
local incorrectObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local correctAnswerText
local incorrectAnswer
local gameOver
local points = 0
local wrongs = 0
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local lives = 3
local life1
local life2
local life3
local stopGame = false

------------------------------------------------------------------------------------------------
-- SOUNDS
------------------------------------------------------------------------------------------------


local correctSound = audio.loadSound("Sounds/clap.mp3")
local correctSoundChannel
local incorrectSound = audio.loadSound("Sounds/boo.mp3")
local incorrectSoundChannel
local gameOverSound = audio.loadSound("Sounds/wasted.mp3")
local gameOverSoundChannel

------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------

local function AskQuestion()
    -- generate a random number between 1 and 4
    randomOperator = math.random(1, 4)

	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 4)
    randomNumber2 = math.random(0, 4)
    
    -- if the random operator is 1, then do addition
    if (randomOperator == 1) then

        -- calculate the correct answer
        correctAnswer = randomNumber1 + randomNumber2

        -- create question in text object
        questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "
    
    -- otherwise, if the random operator is 2, do subtraction
    elseif (randomOperator == 2) then
        
        if (randomNumber2 > randomNumber1) then
        
        -- calculate answer with numbers flipped
        correctAnswer = randomNumber2 - randomNumber1

        -- create question in text object
        questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
        else 
	    -- calculate the correct answer
	    correctAnswer = randomNumber1 - randomNumber2

	    -- create question in text object
        questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
        end

    -- otherwise, if the random operator is 3, do multiplication
    elseif (randomOperator == 3) then

        -- calculate the correct answer
        correctAnswer = randomNumber1 * randomNumber2

        -- create question in text object
        questionObject.text = randomNumber1 .. " * " .. randomNumber2 .. " = "

     -- otherwise, if the random operator is 4, do division
    elseif (randomOperator == 4) then

        -- calculate the correct answer
        correctAnswer = randomNumber1/randomNumber2
		correctAnswer = correctAnswer * 10
		correctAnswer = math.round(correctAnswer)
		correctAnswer = correctAnswer / 10

         -- create question in text object
        questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

    end
end

local function LoseLives()

	incorrectSoundChannel = audio.play(incorrectSound)

	lives = lives - 1

	secondsLeft = totalSeconds

	if (lives == 2) then
		life3.isVisible = false
	elseif (lives == 1) then
		life2.isVisible = false
	elseif (lives == 0) then
		life1.isVisible = false
	    gameOverSoundChannel = audio.play(gameOverSound)
		numericField.isVisible = false
		gameOver.isVisible = true
		timer.cancel(countDownTimer)
		incorrectObject.isVisible = false
		clockText.isVisible = false
		stopGame = true
		backgroundSound = audio.stop(backgroundSoundChannel)
	end
end

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0) then
		-- reset the number of seconds left
		LoseLives()
	    AskQuestion()
	end
end



-- function that calls the timer
local function StartTimer()
		-- create a countdown timer that loops infinitely
		countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	if (stopGame == false) then
	AskQuestion()
	end
end

local function HideCorrectAnswerText()
	correctAnswerText.isVisible = false
end

local function NumericFieldListener (event)

	-- user begins editing "numericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""
           
	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the user's answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
		
			-- give a point if the user gets the correct answer, display "Correct!", and play a correct answer sound
			points = points + 1
			correctObject.isVisible = true
			correctSoundChannel = audio.play(correctSound)
			secondsLeft = totalSeconds

			-- update it in the display object
			pointsText.text = "POINTS = " .. points

			-- perform HideCorrect with a delay and clear the text field
			timer.performWithDelay(1500, HideCorrect)
			event.target.text = ""

		else

			-- display "Incorrect!", show the right answer, and subtract one life
			incorrectObject.isVisible = true
			correctAnswerText = display.newText( "The right answer is " .. correctAnswer, 700, 600, nil, 50)
			correctAnswerText:setTextColor(255/255, 0/255, 255/255)
			timer.performWithDelay(2000, HideIncorrect)
			timer.performWithDelay(2000, HideCorrectAnswerText)
			event.target.text = ""
			LoseLives()

			-- play incorrect answer sound
			incorrectSoundChannel = audio.play(incorrectSound)
		end	
	end
end

------------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------------

-- display the amount of points as a text object
pointsText = display.newText("POINTS = " .. points, 800, 400, nil, 50)
pointsText:setTextColor(255/255, 0/255, 0/255)

-- display the number of seconds remaining
clockText = display.newText( secondsLeft .. "", 500, 80, nil, 100)
clockText:setTextColor(255/255, 0/255, 0/255)
clockText.isVisible = true

-- displays a question and sets the colour
questionObject = display.newText("", 500, 200, nil, 100)
questionObject:setTextColor(0/255, 0/255, 0/255)

-- create the correct text object and make it invisible
correctObject = display.newText("RIGHT ON!!", 200, 600, nil, 50)
correctObject:setTextColor(0/255, 0/255, 204/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible
incorrectObject = display.newText("WRONG", 200, 600, nil, 50)
incorrectObject:setTextColor(0/255, 0/255, 0/255)
incorrectObject.isVisible = false

-- create game over image
gameOver = display.newImageRect("Images/wasted.png", 1000, 1000)
gameOver.x = 500
gameOver.y = 500
gameOver.isVisible = false

-- create numeric field
numericField = native.newTextField(500, 400, 150, 100)
numericField.inputType = "number"

-- add the event listeners for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-- create the lives to display on the screen
life1 = display.newImageRect("Images/Heart.png", 100, 100)
life1.x = 750
life1.y = 80

life2 = display.newImageRect("Images/Heart.png", 100, 100)
life2.x = 850
life2.y = 80

life3 = display.newImageRect("Images/Heart.png", 100, 100)
life3.x = 950
life3.y = 80

------------------------------------------------------------------------------------------------
-- FUNCTION CALLS
------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()

-- update the timer
StartTimer()
