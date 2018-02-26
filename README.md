# simpleScale
A simple library for scaling games made in love2d to any window size and aspect ratio.

![](https://thumbs.gfycat.com/CrazyShortAuklet-size_restricted.gif)

Scales the game while maintaining its aspect ratio, adding vertical or horizontal letterBoxes if necessary.
Inspired by TLfres https://love2d.org/wiki/TLfres

TO USE:

1.  Import simpleScale

2.  In love.load call `simpleScale.setWindow(gameWidth, gameHeight, screenWidth, screenHeight, flags)`

    `gameWidth` - width of the game

    `gameHeight` - height of the game

    `screenWidth` - width of the final screen

    `screenHeighth` - height of the final screen

    `flags` - a table of optional flags corresponding to those used in love.window.setmode https://love2d.org/wiki/love.window.setMode

3.  At the start of love.draw call `simpleScale.set()`

4.  At the end of love.draw call `simpleScale.unSet()`

5.  To update the window, just call `simpleScale.updateWindow(screenWidth, screenHeight, flags)`
  
