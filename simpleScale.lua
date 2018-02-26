simpleScale = {}
--Your Game's Aspect Ratio
local gAspectRatio
--The Window's Aspect Ratio
local wAspectRatio
--The scale between the game and the window's aspect ratio.
simpleScale.scale = 1

local xt, yt = 0, 0, 1
local gameW, gameH, windowW, windowH = 800, 600, 800, 600

-- Declares your game's width and height, and sets the window size/settings
-- To be used instead of love.window.setMode
--gw and gh are the width and height of the initial game
--sw and sh are the width and height of the final window
--settings are settings for love.window.setMode
function simpleScale.setWindow(gw, gh, sw, sh, settings)	
	gAspectRatio = gw/gh
	gameW = gw
	gameH = gh
	simpleScale.updateWindow(sw, sh, settings)
end

-- Updates the Window size/settings
-- To be used instead of love.window.setMode
--sw and sh are the width and height of the new Window
--settings are settings for love.window.setMode
function simpleScale.updateWindow(sw, sh, settings)
	love.window.setMode(sw, sh, settings)
	windowW, windowH = love.graphics.getWidth(), love.graphics.getHeight()
	wAspectRatio = windowW/windowH

	--Window aspect ratio is TALLER than game
	if gAspectRatio > wAspectRatio then
		scale = windowW/gameW
		xt = 0
		yt = windowH/2 - (scale*gameH)/2

	--Window aspect ratio is WIDER than game
	elseif gAspectRatio < wAspectRatio then
		scale = windowH/gameH
		xt = windowW/2 - (scale*gameW)/2
		yt = 0

	--Window and game aspect ratios are EQUAL
	else
		scale = windowW/gameW

		xt = 0
		yt = 0
	end
	simpleScale.scale = scale
end

-- Transforms the game's window relative to the entire window
-- Call this at the beginning of love.draw()
function simpleScale.set()
	love.graphics.translate(xt, yt)
	love.graphics.scale(scale, scale)
end

-- Untransforms the game's window
-- Call this at the end of love.draw
function simpleScale.unSet(coloR, g, b, a)
	love.graphics.scale(1/scale, 1/scale)
	love.graphics.translate(-xt, -yt)

	--Draw the Letterboxes
	local r,g,b,a = love.graphics.getColor()
	local originalColor = love.graphics.getColor()
	local boxColor
	if color == nil then
		boxColor = {0,0,0}
	elseif type(color) ~= "table" then
		boxColor = {coloR, g, b, a}
	else
		boxColor = coloR
	end
	love.graphics.setColor(boxColor)
	--Vertical bars
	if gAspectRatio > wAspectRatio then
		love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), math.abs((gameH*scale - (windowH))/2))
		love.graphics.rectangle("fill", 0, love.graphics.getHeight(), love.graphics.getWidth(), -math.abs((gameH*scale - (windowH))/2))
		--Horizontal bars
	elseif gAspectRatio < wAspectRatio then
		love.graphics.rectangle("fill", 0, 0, math.abs((gameW*scale - (windowW))/2),love.graphics.getHeight())
		love.graphics.rectangle("fill", love.graphics.getWidth(), 0, -math.abs((gameW*scale - (windowW))/2),love.graphics.getHeight())
	end
	love.graphics.setColor(r,g,b,a)
end