-- Example Project

function love.load()
	love.window.setTitle("SimpleScale Demo")
	require "simpleScale"
	love.graphics.setDefaultFilter("nearest","nearest")
	im_ship = love.graphics.newImage("ship.png")
	love.graphics.setBackgroundColor(100,110,140)

	scaleType = 1
	width = 300
	height = 300
	windowWidth = 300
	widthHeight = 300
	fullscreen = false
	simpleScale.setWindow(width,height,windowWidth,widthHeight, {fullscreen = fullscreen, resizable = true});

	function updateScale()
		simpleScale.updateWindow(windowWidth,widthHeight, {fullscreen = fullscreen, resizable = true});
	end
end

function love.update()
	simpleScale.resizeUpdate()
	if love.keyboard.isDown("left") then
		windowWidth = math.max(windowWidth - 50, 50)
		fullscreen = false
		updateScale()
	elseif love.keyboard.isDown("right") then
		windowWidth = windowWidth + 50
		fullscreen = false
		updateScale()
	elseif love.keyboard.isDown("down") then
		widthHeight = math.max(widthHeight - 50, 50)
		fullscreen = false
		updateScale()
	elseif love.keyboard.isDown("up") then
		widthHeight = widthHeight + 50
		fullscreen = false
		updateScale()
	elseif love.keyboard.isDown("f") then
		fullscreen = not fullscreen
		updateScale()
	end
end

function love.draw()
	simpleScale.set()
	love.graphics.print("Press\nRight: Increase Width\nLeft: Decrease Width\nUp:Increase Height\nDown: Decrease Height\nF: Toggle Fullscreen", 0, 0)
	love.graphics.draw(im_ship,150,150,0,1,1,81/2,52/2)
	simpleScale.unSet()
end