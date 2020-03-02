-- Name: Thomas Kushner
-- Course: ICS20/3C
-- This program displays Hello, World on the iPad simulator and "Heloooooooooo!" 
-- To the command terminal
--------------------------------------------------------------------------------

--print "Hello, World" to the command terminal\
print ("***Helloooooooooo!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the backround colour
display.setDefault("background", 255/255, 0/255, 0/255 )

-- create a local variable
local textSignature

-- displays text on the screen at position x = 500 and y = 500 with
-- a deafult font style and font size of 55
textSignature = display.newText( " By: Thomas Kushner!!", 500, 500, nil, 50 )

-- create a local variable
local textObject


-- raises the text
textObject = display.newText("HELLO EVERYBODY!!!!!!!!", 550, 300, nil, 70)


-- sets the color of the text
textObject:setTextColor(0/255, 0/255, 0/255)