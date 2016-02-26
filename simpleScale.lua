simpleScale = {}
--The Game's Aspect Ratio
local gAspectRatio
--The Screen's Aspect Ratio
local sAspectRatio
local xt, yt, scale = 0, 0, 1
local gameW, gameH, screenW, screenH = 800, 600, 800, 600
local screenType

--gameW and gameH are the width and height of the initial game
--screenW and screenH are the width and height of the final screen
function simpleScale.setScreen(gw, gh, sw, sh, settings)
	gAspectRatio = gw/gh
	sAspectRatio = sw/sh
	love.window.setMode(sw,sh, settings)
	gameW, gameH, screenW, screenH = gw, gh, love.graphics.getWidth(), love.graphics.getHeight()

	--Screen aspect ratio is TALLER than game
	if gAspectRatio > sAspectRatio then
		scale = screenW/gameW

		xt = 0
		yt = screenH/2 - (scale*gameH)/2

		--Screen aspect ratio is WIDER than game
	elseif gAspectRatio < sAspectRatio then
		scale = screenH/gameH

		xt = screenW/2 - (scale*gameW)/2
		yt = 0
	else
		scale = screenW/gameW
		xt = 0
		yt = 0
	end

end

-- Transforms screen geometry. Call this at the beginning of love.draw().
function simpleScale.transform()
	love.graphics.translate(xt, yt)
	love.graphics.scale(scale, scale)
end

function simpleScale.letterBox(color)
	boxColor = color or {0,0,0}
	lg.setColor(boxColor)
	if gAspectRatio > sAspectRatio then
		love.graphics.rectangle("fill", 0, 0, screenW/scale, -(yt/scale)-1)
		love.graphics.rectangle("fill", gameW, 0, screenW/scale, (yt/scale)+1)
	elseif gAspectRatio < sAspectRatio then
		love.graphics.rectangle("fill", 0, 0, -(xt/scale)-1, screenH)
		love.graphics.rectangle("fill", gameW, 0, (xt/scale)+1, screenH)

	end
end