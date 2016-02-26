# simpleScale
A simple library for scaling games made in love2d to any screen size.
Scales the game while maintaining its aspect ratio, adding vertical or horizontal letterBoxes if necessary.
Inspired by TLfres https://love2d.org/wiki/TLfres

TO USE:

1.  In love.load call simpleScale.setScreen(gameWidth, gameHeight, screenWidth, screenHeight, flags)
gameWidth - width of the game
gameHeight - height of the game
screenWidth - width of the final screen
screenHeighth - height of the final screen
flags - a table of optional flags corresponding to those used in love.window.setmode https://love2d.org/wiki/love.window.setMode

2.  At the start of love.draw call simpleScale.transform()

3.  At the end of love.draw call simpleScale.letterBox()

