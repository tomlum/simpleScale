# simpleScale
A simple library for scaling games made in [LÖVE](https://love2d.org) to any window size and aspect ratio.

![](https://thumbs.gfycat.com/CrazyShortAuklet-size_restricted.gif)

Scales the game while maintaining its aspect ratio, adding vertical or horizontal letterboxes if necessary.
Inspired by [TLfres](https://love2d.org/wiki/TLfres) and used in [SuperLuminauts](https://www.superluminauts.com/).

TO USE:

1.  Import simpleScale

2.  In love.load call `simpleScale.setWindow(gameWidth, gameHeight, windowWidth, windowHeight, flags)`

    `gameWidth` - width of the game

    `gameHeight` - height of the game

    `windowWidth` - width of the final window

    `windowHeight` - height of the final window

    `flags` - a table of optional flags corresponding to those used in love.window.setmode https://love2d.org/wiki/love.window.setMode

3.  At the start of love.draw call `simpleScale.set()`

4.  At the end of love.draw call `simpleScale.unSet()`

Additional Features:

* To update the window again, just call `simpleScale.updateWindow(windowWidth, windowHeight, flags)`

* To change the color of the letterboxes, simply call `simpleScale.unSet({r, g, b})`.  Alpha values are optionally accepted as well.

* If your window needs to be resizable by dragging, just call `simpleScale.resizeUpdate()` in love.update
