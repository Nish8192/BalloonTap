-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local physics = require("physics")
local widget = require("widget")

physics.start()


local background = display.newImageRect("background.png", 360, 570)
background.x = display.contentCenterX
background.y = display.contentCenterY

local platform = display.newImageRect("platform.png", 300, 50)
platform.x = display.contentCenterX
platform.y = display.contentHeight - 25

local balloon = display.newImageRect("balloon.png", 112, 112)
balloon.x = display.contentCenterX
balloon.y = display.contentCenterY

local resetButton = widget.newButton({ id="reset_button", x = 60, y = 20 })
resetButton:setLabel("Reset Game")

physics.addBody(platform, "static")
physics.addBody(balloon, "dynamic", { radius=50, bounce=0.5 })

local tapCount = 0

local tapText = display.newText(tapCount, display.contentWidth - 50, 20, native.systemFont, 40)

local function pushBalloon()
    balloon:applyLinearImpulse(0.0, -0.5, balloon.x, balloon.y)
    tapCount = tapCount + 1
    tapText.text = tapCount
end

local function resetGame()
    balloon.x = display.contentCenterX
    balloon.y = display.contentCenterY
    tapCount = 0
    tapText.text = tapCount
end

tapText:setFillColor(0, 0, 0)

balloon:addEventListener("tap", pushBalloon)
resetButton:addEventListener("tap", resetGame)
